#!/usr/bin/env python3
"""
Generate a SQL delta migration for NIST catalog updates.

Compares the OLD catalog (from git HEAD) against the NEW catalog (current
files in core/db/sources/) and writes a migration to core/db/migrations/.

Must be run AFTER fetch_nist_sources.py (which updates core/db/sources/)
but BEFORE convert_nist_oscal.py (so git HEAD still holds the old sources).

Usage (from repo root):
    python scripts/generate_nist_migration.py

Exits 0 in all cases. If no diff is found or old data cannot be loaded
from git, no migration file is written.
"""

import hashlib
import json
import subprocess
import sys
from datetime import datetime, timezone
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
SOURCES_DIR = REPO_ROOT / "core" / "db" / "sources"
MIGRATIONS_DIR = REPO_ROOT / "core" / "db" / "migrations"

CATALOG_FILENAME = "NIST_SP-800-53_rev5_catalog.json"
BASELINE_FILENAMES = {
    "low":      "NIST_SP-800-53_rev5_LOW-baseline-resolved-profile_catalog.json",
    "moderate": "NIST_SP-800-53_rev5_MODERATE-baseline-resolved-profile_catalog.json",
    "high":     "NIST_SP-800-53_rev5_HIGH-baseline-resolved-profile_catalog.json",
}

_EXCLUDE_PART_NAMES = {"assessment-objective", "assessment-method", "assessment-objects", "guidance"}


# ── OSCAL parsing (self-contained) ────────────────────────────────────────────

def _collect_prose(parts):
    lines = []
    for part in parts or []:
        if part.get("name") in _EXCLUDE_PART_NAMES:
            continue
        prose = (part.get("prose") or "").strip()
        if prose:
            lines.append(prose)
        lines.extend(_collect_prose(part.get("parts", [])))
    return lines


def _extract_prose(parts, name):
    for part in parts or []:
        if part.get("name") == name:
            lines = []
            prose = (part.get("prose") or "").strip()
            if prose:
                lines.append(prose)
            lines.extend(_collect_prose(part.get("parts", [])))
            return "\n".join(lines)
    return ""


def _parse_control(ctrl, family_id, is_enhancement, parent_id):
    return {
        "control_id":     ctrl["id"],
        "family_id":      family_id,
        "number":         ctrl["id"][len(family_id) + 1:],
        "title":          ctrl["title"],
        "description":    _extract_prose(ctrl.get("parts", []), "statement") or None,
        "guidance":       _extract_prose(ctrl.get("parts", []), "guidance") or None,
        "is_enhancement": is_enhancement,
        "parent_id":      parent_id,
    }


def parse_catalog(catalog_bytes, baseline_bytes_by_level):
    """Parse OSCAL JSON bytes into structured dicts keyed for diffing."""
    catalog = json.loads(catalog_bytes)["catalog"]

    families = {}
    controls = {}
    params   = {}   # key: (control_id, param_id)
    related  = set() # (control_id, related_id)
    baselines = set() # (control_id, level)

    for group in catalog["groups"]:
        fid = group["id"]
        families[fid] = {
            "family_id":    fid,
            "name":         group["title"],
            "abbreviation": fid.upper(),
        }
        for ctrl in group.get("controls", []):
            c = _parse_control(ctrl, fid, False, None)
            controls[c["control_id"]] = c
            for enh in ctrl.get("controls", []):
                e = _parse_control(enh, fid, True, ctrl["id"])
                controls[e["control_id"]] = e
            for target in [ctrl] + ctrl.get("controls", []):
                for p in target.get("params", []):
                    label = (p.get("label") or "").strip()
                    if not label and p.get("guidelines"):
                        label = (p["guidelines"][0].get("prose") or "").strip()
                    params[(target["id"], p["id"])] = label or p["id"]
                for link in target.get("links", []):
                    if link.get("rel") == "related":
                        related.add((target["id"], link["href"].lstrip("#")))

    for level, data in baseline_bytes_by_level.items():
        bl_catalog = json.loads(data)["catalog"]
        for group in bl_catalog["groups"]:
            for ctrl in group.get("controls", []):
                baselines.add((ctrl["id"], level))
                for enh in ctrl.get("controls", []):
                    baselines.add((enh["id"], level))

    version = catalog["metadata"]["version"]
    return {"families": families, "controls": controls, "params": params,
            "related": related, "baselines": baselines, "version": version}


# ── git helpers ───────────────────────────────────────────────────────────────

def git_read(rel_path):
    """Read a file from git HEAD. Returns bytes or None if not tracked."""
    result = subprocess.run(
        ["git", "show", f"HEAD:{rel_path}"],
        capture_output=True,
        cwd=REPO_ROOT,
    )
    return result.stdout if result.returncode == 0 else None


def sha256(data):
    return hashlib.sha256(data).hexdigest()


# ── SQL helpers ───────────────────────────────────────────────────────────────

def q(value):
    if value is None:
        return "NULL"
    return "'" + str(value).replace("'", "''") + "'"


def b(value):
    return "TRUE" if value else "FALSE"


# ── diff + SQL generation ─────────────────────────────────────────────────────

def generate_migration_sql(old, new, old_hash, new_hash):
    lines = []
    now = datetime.now(timezone.utc).isoformat()

    old_v = old["version"]
    new_v = new["version"]

    lines += [
        f"-- NIST 800-53 Catalog Migration: {old_v} → {new_v}",
        f"-- Generated: {now}",
        f"-- Old source hash: {old_hash}",
        f"-- New source hash: {new_hash}",
        f"-- Do not edit manually.",
        "",
        "BEGIN;",
        "",
    ]

    # ── Families ──────────────────────────────────────────────────────────────
    added_fams   = {k: v for k, v in new["families"].items() if k not in old["families"]}
    changed_fams = {
        k: v for k, v in new["families"].items()
        if k in old["families"] and v != old["families"][k]
    }

    if added_fams:
        lines.append("-- New families")
        lines.append("INSERT INTO nist_families (family_id, name, abbreviation) VALUES")
        rows = [f"  ({q(f['family_id'])}, {q(f['name'])}, {q(f['abbreviation'])})" for f in added_fams.values()]
        lines.append(",\n".join(rows) + "\nON CONFLICT (family_id) DO NOTHING;")
        lines.append("")

    if changed_fams:
        lines.append("-- Updated families")
        for f in changed_fams.values():
            lines.append(
                f"UPDATE nist_families SET name = {q(f['name'])}, abbreviation = {q(f['abbreviation'])} "
                f"WHERE family_id = {q(f['family_id'])};"
            )
        lines.append("")

    # ── Controls ──────────────────────────────────────────────────────────────
    added_ctrls   = {k: v for k, v in new["controls"].items() if k not in old["controls"]}
    removed_ctrls = {k: v for k, v in old["controls"].items() if k not in new["controls"]}
    changed_ctrls = {
        k: v for k, v in new["controls"].items()
        if k in old["controls"] and v != old["controls"][k]
    }

    # Removals: enhancements first, then base controls
    if removed_ctrls:
        removed_enhs  = [c for c in removed_ctrls.values() if c["is_enhancement"]]
        removed_base  = [c for c in removed_ctrls.values() if not c["is_enhancement"]]
        all_removed_ids = [c["control_id"] for c in removed_enhs + removed_base]
        id_list = ", ".join(q(cid) for cid in all_removed_ids)

        lines.append("-- Remove params, related, baselines for removed controls")
        lines.append(f"DELETE FROM nist_params WHERE control_id IN ({id_list});")
        lines.append(f"DELETE FROM nist_related_controls WHERE control_id IN ({id_list});")
        lines.append(f"DELETE FROM nist_baselines WHERE control_id IN ({id_list});")
        lines.append("")

        if removed_enhs:
            lines.append("-- Remove enhancements")
            enh_ids = ", ".join(q(c["control_id"]) for c in removed_enhs)
            lines.append(f"DELETE FROM nist_controls WHERE control_id IN ({enh_ids});")
            lines.append("")

        if removed_base:
            lines.append("-- Remove base controls")
            base_ids = ", ".join(q(c["control_id"]) for c in removed_base)
            lines.append(f"DELETE FROM nist_controls WHERE control_id IN ({base_ids});")
            lines.append("")

    # Additions: base controls first, then enhancements
    col = "(control_id, family_id, number, title, description, guidance, is_enhancement, parent_id)"
    for group, label in [
        ([c for c in added_ctrls.values() if not c["is_enhancement"]], "New base controls"),
        ([c for c in added_ctrls.values() if c["is_enhancement"]],     "New enhancements"),
    ]:
        if not group:
            continue
        lines.append(f"-- {label}")
        lines.append(f"INSERT INTO nist_controls {col} VALUES")
        rows = [
            f"  ({q(c['control_id'])}, {q(c['family_id'])}, {q(c['number'])}, "
            f"{q(c['title'])}, {q(c['description'])}, {q(c['guidance'])}, "
            f"{b(c['is_enhancement'])}, {q(c['parent_id'])})"
            for c in group
        ]
        lines.append(",\n".join(rows) + "\nON CONFLICT (control_id) DO NOTHING;")
        lines.append("")

    # Updates
    if changed_ctrls:
        lines.append("-- Updated controls")
        for c in changed_ctrls.values():
            lines.append(
                f"UPDATE nist_controls SET "
                f"title = {q(c['title'])}, "
                f"description = {q(c['description'])}, "
                f"guidance = {q(c['guidance'])} "
                f"WHERE control_id = {q(c['control_id'])};"
            )
        lines.append("")

    # ── Params ────────────────────────────────────────────────────────────────
    added_params   = {k: v for k, v in new["params"].items() if k not in old["params"]}
    removed_params = {k: v for k, v in old["params"].items() if k not in new["params"]}
    changed_params = {
        k: v for k, v in new["params"].items()
        if k in old["params"] and v != old["params"][k]
    }

    if removed_params:
        lines.append("-- Removed params")
        for (cid, pid) in removed_params:
            lines.append(f"DELETE FROM nist_params WHERE control_id = {q(cid)} AND param_id = {q(pid)};")
        lines.append("")

    if added_params:
        lines.append("-- New params")
        lines.append("INSERT INTO nist_params (control_id, param_id, label) VALUES")
        rows = [f"  ({q(cid)}, {q(pid)}, {q(label)})" for (cid, pid), label in added_params.items()]
        lines.append(",\n".join(rows) + "\nON CONFLICT (control_id, param_id) DO NOTHING;")
        lines.append("")

    if changed_params:
        lines.append("-- Updated params")
        for (cid, pid), label in changed_params.items():
            lines.append(
                f"UPDATE nist_params SET label = {q(label)} "
                f"WHERE control_id = {q(cid)} AND param_id = {q(pid)};"
            )
        lines.append("")

    # ── Related controls ──────────────────────────────────────────────────────
    added_related   = new["related"] - old["related"]
    removed_related = old["related"] - new["related"]

    if removed_related:
        lines.append("-- Removed related control links")
        for (cid, rid) in sorted(removed_related):
            lines.append(
                f"DELETE FROM nist_related_controls "
                f"WHERE control_id = {q(cid)} AND related_id = {q(rid)};"
            )
        lines.append("")

    if added_related:
        lines.append("-- New related control links")
        lines.append("INSERT INTO nist_related_controls (control_id, related_id) VALUES")
        rows = [f"  ({q(cid)}, {q(rid)})" for (cid, rid) in sorted(added_related)]
        lines.append(",\n".join(rows) + "\nON CONFLICT (control_id, related_id) DO NOTHING;")
        lines.append("")

    # ── Baselines ─────────────────────────────────────────────────────────────
    added_baselines   = new["baselines"] - old["baselines"]
    removed_baselines = old["baselines"] - new["baselines"]

    if removed_baselines:
        lines.append("-- Removed baseline assignments")
        for (cid, level) in sorted(removed_baselines):
            lines.append(
                f"DELETE FROM nist_baselines "
                f"WHERE control_id = {q(cid)} AND level = {q(level)};"
            )
        lines.append("")

    if added_baselines:
        lines.append("-- New baseline assignments")
        lines.append("INSERT INTO nist_baselines (control_id, level) VALUES")
        rows = [f"  ({q(cid)}, {q(level)})" for (cid, level) in sorted(added_baselines)]
        lines.append(",\n".join(rows) + "\nON CONFLICT (control_id, level) DO NOTHING;")
        lines.append("")

    # ── Version record ────────────────────────────────────────────────────────
    lines += [
        "-- Catalog version record",
        "INSERT INTO catalog_versions (catalog_name, version, source_hash, applied_at, migration_type, notes) VALUES",
        f"  ('nist-800-53', {q(new_v)}, {q(new_hash)}, NOW(), 'migration',",
        f"   {q(f'NIST SP 800-53 Rev 5 {old_v} → {new_v}')});",
        "",
        "COMMIT;",
    ]

    return "\n".join(lines) + "\n"


# ── summary ───────────────────────────────────────────────────────────────────

def print_summary(old, new):
    added_c   = set(new["controls"]) - set(old["controls"])
    removed_c = set(old["controls"]) - set(new["controls"])
    changed_c = {k for k in new["controls"] if k in old["controls"] and new["controls"][k] != old["controls"][k]}
    added_p   = set(new["params"]) - set(old["params"])
    removed_p = set(old["params"]) - set(new["params"])
    changed_p = {k for k in new["params"] if k in old["params"] and new["params"][k] != old["params"][k]}

    print(f"\n  Controls : +{len(added_c)} added, -{len(removed_c)} removed, ~{len(changed_c)} updated")
    print(f"  Params   : +{len(added_p)} added, -{len(removed_p)} removed, ~{len(changed_p)} updated")
    print(f"  Related  : +{len(new['related'] - old['related'])} added, -{len(old['related'] - new['related'])} removed")
    print(f"  Baselines: +{len(new['baselines'] - old['baselines'])} added, -{len(old['baselines'] - new['baselines'])} removed")


# ── main ──────────────────────────────────────────────────────────────────────

def main():
    # Load old data from git HEAD
    print("Loading OLD catalog from git HEAD...")
    old_catalog_bytes = git_read(f"core/db/sources/{CATALOG_FILENAME}")
    if old_catalog_bytes is None:
        print("  No previous catalog found in git — skipping migration generation.")
        print("  (This is expected on the first commit.)")
        return

    old_baseline_bytes = {}
    for level, filename in BASELINE_FILENAMES.items():
        data = git_read(f"core/db/sources/{filename}")
        if data is None:
            print(f"  Missing baseline file in git HEAD: {filename} — skipping.")
            return
        old_baseline_bytes[level] = data

    old_hash = sha256(old_catalog_bytes)
    old = parse_catalog(old_catalog_bytes, old_baseline_bytes)
    print(f"  Old version : {old['version']}")

    # Load new data from updated files on disk
    print("Loading NEW catalog from core/db/sources/...")
    new_catalog_path = SOURCES_DIR / CATALOG_FILENAME
    if not new_catalog_path.exists():
        print("  ERROR: New catalog file not found on disk.", file=sys.stderr)
        sys.exit(1)

    new_catalog_bytes = new_catalog_path.read_bytes()
    new_baseline_bytes = {
        level: (SOURCES_DIR / filename).read_bytes()
        for level, filename in BASELINE_FILENAMES.items()
    }

    new_hash = sha256(new_catalog_bytes)
    new = parse_catalog(new_catalog_bytes, new_baseline_bytes)
    print(f"  New version : {new['version']}")

    if old_hash == new_hash:
        print("\nCatalogs are identical — no migration needed.")
        return

    print("\nDiff summary:")
    print_summary(old, new)

    # Generate migration SQL
    sql = generate_migration_sql(old, new, old_hash, new_hash)

    # Write migration file
    MIGRATIONS_DIR.mkdir(parents=True, exist_ok=True)
    timestamp = datetime.now(timezone.utc).strftime("%Y%m%d_%H%M%S")
    filename = f"{timestamp}_nist-800-53_{old['version']}_to_{new['version']}.sql"
    out_path = MIGRATIONS_DIR / filename
    out_path.write_text(sql)

    print(f"\nMigration written: core/db/migrations/{filename}")


if __name__ == "__main__":
    main()
