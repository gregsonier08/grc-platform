"""Database connection management.

Resolution order:
  1. DATABASE_URL env var  (Docker / local)
  2. Individual DB_* env vars
  3. AWS Secrets Manager (Lambda)
"""

import os
import json
import pg8000.native


def _get_secret(secret_arn: str) -> dict:
    import boto3
    client = boto3.client("secretsmanager")
    response = client.get_secret_value(SecretId=secret_arn)
    return json.loads(response["SecretString"])


def get_connection():
    database_url = os.environ.get("DATABASE_URL")

    if database_url:
        # postgresql://user:password@host:port/dbname
        from urllib.parse import urlparse
        u = urlparse(database_url)
        return pg8000.native.Connection(
            host=u.hostname,
            port=u.port or 5432,
            database=u.path.lstrip("/"),
            user=u.username,
            password=u.password,
        )

    db_host = os.environ.get("DB_HOST")
    db_name = os.environ.get("DB_NAME")
    db_user = os.environ.get("DB_USER")
    db_password = os.environ.get("DB_PASSWORD")

    if not db_password:
        secret_arn = os.environ.get("DB_SECRET_ARN")
        if secret_arn:
            secret = _get_secret(secret_arn)
            db_user = db_user or secret.get("username")
            db_password = secret.get("password")
            db_host = db_host or secret.get("host")
            db_name = db_name or secret.get("dbname")

    return pg8000.native.Connection(
        host=db_host,
        port=int(os.environ.get("DB_PORT", 5432)),
        database=db_name,
        user=db_user,
        password=db_password,
    )
