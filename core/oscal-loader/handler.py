"""OSCAL Loader Lambda — reads seed SQL from S3, applies to RDS.

Supports two actions via event payload:
  {"action": "reseed"}  — drop all tables, apply schema, load all seed files (default)
  {"action": "status"}  — return current catalog version from DB
"""

import json
import os
import boto3
from db import get_connection

OSCAL_BUCKET = os.environ.get("OSCAL_BUCKET", "")
S3_PREFIX = "seed/"

s3 = boto3.client("s3")

# Tables in drop order (reverse dependency order)
DROP_TABLES = [
    "crosswalk_mappings",
    "ai_rmf_subcategories",
    "ai_rmf_categories",
    "ai_rmf_functions",
    "nist_related_controls",
    "nist_params",
    "nist_baselines",
    "nist_controls",
    "nist_families",
    "catalog_versions",
]


def _read_s3(key):
    """Read a file from S3 and return its contents as a string."""
    resp = s3.get_object(Bucket=OSCAL_BUCKET, Key=key)
    return resp["Body"].read().decode("utf-8")


def _list_seed_keys():
    """List all .sql seed files under the S3 prefix, sorted by name."""
    paginator = s3.get_paginator("list_objects_v2")
    keys = []
    for page in paginator.paginate(Bucket=OSCAL_BUCKET, Prefix=S3_PREFIX):
        for obj in page.get("Contents", []):
            key = obj["Key"]
            filename = key.split("/")[-1]
            if filename.endswith(".sql") and filename != "schema.sql":
                keys.append(key)
    return sorted(keys, key=lambda k: k.split("/")[-1])


def _execute_sql(conn, sql):
    """Execute a SQL string. Handles multi-statement files via PostgreSQL simple query protocol."""
    conn.run(sql)


def _reseed():
    """Drop all tables, apply schema, load all seed files from S3."""
    conn = get_connection()
    results = {"action": "reseed", "steps": []}

    # Drop tables
    for table in DROP_TABLES:
        conn.run(f"DROP TABLE IF EXISTS {table} CASCADE")
    results["steps"].append(f"Dropped {len(DROP_TABLES)} tables")

    # Apply schema
    schema_sql = _read_s3(f"{S3_PREFIX}schema.sql")
    _execute_sql(conn, schema_sql)
    results["steps"].append("Applied schema.sql")

    # Load seed files
    seed_keys = _list_seed_keys()
    for key in seed_keys:
        filename = key.split("/")[-1]
        sql = _read_s3(key)
        _execute_sql(conn, sql)
        results["steps"].append(f"Loaded {filename}")

    # Verify row counts
    counts = {}
    for table in ["nist_controls", "nist_baselines", "ai_rmf_subcategories", "crosswalk_mappings"]:
        rows = conn.run(f"SELECT COUNT(*) FROM {table}")
        counts[table] = rows[0][0]
    results["row_counts"] = counts

    conn.close()
    return results


def _status():
    """Return current catalog version from DB."""
    conn = get_connection()
    rows = conn.run(
        "SELECT catalog_name, version, source_hash, applied_at, migration_type "
        "FROM catalog_versions ORDER BY applied_at DESC LIMIT 5"
    )
    conn.close()
    versions = [
        {
            "catalog_name": r[0],
            "version": r[1],
            "source_hash": r[2],
            "applied_at": str(r[3]),
            "migration_type": r[4],
        }
        for r in rows
    ]
    return {"action": "status", "versions": versions}


def lambda_handler(event, context):
    action = event.get("action", "reseed")

    try:
        if action == "reseed":
            result = _reseed()
        elif action == "status":
            result = _status()
        else:
            return {"status": "error", "message": f"Unknown action: {action}"}

        return {"status": "ok", **result}

    except Exception as exc:
        return {"status": "error", "message": str(exc)}
