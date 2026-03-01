#!/usr/bin/env python3
"""
Convert NIST OSCAL JSON catalog files to SQL seed files.

Source JSONs : core/db/sources/
Output SQL   : core/db/seed/

Run from repo root:
    python scripts/convert_nist_oscal.py
"""

import json
import hashlib
from datetime import datetime, timezone
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
SOURCES_DIR = REPO_ROOT / "core" / "db" / "sources"
SEED_DIR = REPO_ROOT / "core" / "db" / "seed"

CATALOG_FILE = SOURCES_DIR / "NIST_SP-800-53_rev5_catalog.json"
BASELINE_FILES = {
    "low":      SOURCES_DIR / "NIST_SP-800-53_rev5_LOW-baseline-resolved-profile_catalog.json",
    "moderate": SOURCES_DIR / "NIST_SP-800-53_rev5_MODERATE-baseline-resolved-profile_catalog.json",
    "high":     SOURCES_DIR / "NIST_SP-800-53_rev5_HIGH-baseline-resolved-profile_catalog.json",
}

# Part names to exclude from control description (non-requirement content)
_EXCLUDE_PART_NAMES = {"assessment-objective", "assessment-method", "assessment-objects", "guidance"}


# ── helpers ───────────────────────────────────────────────────────────────────

def q(value) -> str:
    """Escape and quote a value for SQL. Returns NULL for None."""
    if value is None:
        return "NULL"
    return "'" + str(value).replace("'", "''") + "'"


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def load_catalog(path: Path) -> dict:
    with open(path) as f:
        return json.load(f)["catalog"]


def _collect_prose(parts: list) -> list[str]:
    """Recursively collect non-empty prose from parts, excluding non-requirement sections."""
    lines = []
    for part in parts or []:
        if part.get("name") in _EXCLUDE_PART_NAMES:
            continue
        prose = (part.get("prose") or "").strip()
        if prose:
            lines.append(prose)
        lines.extend(_collect_prose(part.get("parts", [])))
    return lines


def extract_prose(parts: list, name: str) -> str:
    """Extract all prose from the first part matching name, including all descendants."""
    for part in parts or []:
        if part.get("name") == name:
            lines = []
            prose = (part.get("prose") or "").strip()
            if prose:
                lines.append(prose)
            lines.extend(_collect_prose(part.get("parts", [])))
            return "\n".join(lines)
    return ""


# ── extraction ────────────────────────────────────────────────────────────────

def extract_families(catalog: dict) -> list[dict]:
    return [
        {
            "family_id":    group["id"],
            "name":         group["title"],
            "abbreviation": group["id"].upper(),
        }
        for group in catalog["groups"]
    ]


def _parse_control(ctrl: dict, family_id: str, is_enhancement: bool, parent_id: str | None) -> dict:
    number = ctrl["id"][len(family_id) + 1:]  # strip "ac-" prefix
    return {
        "control_id":    ctrl["id"],
        "family_id":     family_id,
        "number":        number,
        "title":         ctrl["title"],
        "description":   extract_prose(ctrl.get("parts", []), "statement") or None,
        "guidance":      extract_prose(ctrl.get("parts", []), "guidance") or None,
        "is_enhancement": is_enhancement,
        "parent_id":     parent_id,
    }


def extract_controls(catalog: dict) -> list[dict]:
    controls = []
    for group in catalog["groups"]:
        family_id = group["id"]
        for ctrl in group.get("controls", []):
            controls.append(_parse_control(ctrl, family_id, False, None))
            for enh in ctrl.get("controls", []):
                controls.append(_parse_control(enh, family_id, True, ctrl["id"]))
    return controls


def extract_params(catalog: dict) -> list[dict]:
    params = []
    for group in catalog["groups"]:
        for ctrl in group.get("controls", []):
            for c in [ctrl] + ctrl.get("controls", []):
                for p in c.get("params", []):
                    label = (p.get("label") or "").strip()
                    if not label and p.get("guidelines"):
                        label = (p["guidelines"][0].get("prose") or "").strip()
                    params.append({
                        "control_id": c["id"],
                        "param_id":   p["id"],
                        "label":      label or p["id"],  # fallback to ID
                    })
    return params


def extract_related(catalog: dict) -> list[dict]:
    related = []
    seen = set()
    for group in catalog["groups"]:
        for ctrl in group.get("controls", []):
            for c in [ctrl] + ctrl.get("controls", []):
                for link in c.get("links", []):
                    if link.get("rel") == "related":
                        related_id = link["href"].lstrip("#")
                        key = (c["id"], related_id)
                        if key not in seen:
                            seen.add(key)
                            related.append({"control_id": c["id"], "related_id": related_id})
    return related


def extract_baseline_ids(path: Path) -> set[str]:
    """Return all control IDs (base + enhancements) in a baseline catalog."""
    catalog = load_catalog(path)
    ids = set()
    for group in catalog["groups"]:
        for ctrl in group.get("controls", []):
            ids.add(ctrl["id"])
            for enh in ctrl.get("controls", []):
                ids.add(enh["id"])
    return ids


# ── SQL writers ───────────────────────────────────────────────────────────────

def _header(description: str) -> list[str]:
    return [
        f"-- {description}",
        "-- Auto-generated by scripts/convert_nist_oscal.py — do not edit manually",
        "",
    ]


def write_families(families: list[dict], out_dir: Path):
    lines = _header("NIST SP 800-53 Control Families")
    lines.append("INSERT INTO nist_families (family_id, name, abbreviation) VALUES")
    rows = [f"  ({q(f['family_id'])}, {q(f['name'])}, {q(f['abbreviation'])})" for f in families]
    lines.append(",\n".join(rows) + ";")
    (out_dir / "02-nist-families.sql").write_text("\n".join(lines) + "\n")


def write_controls(controls: list[dict], out_dir: Path):
    lines = _header("NIST SP 800-53 Controls and Enhancements")
    col = "(control_id, family_id, number, title, description, guidance, is_enhancement, parent_id)"

    # Base controls must be inserted before enhancements (parent_id FK)
    for group, label in [
        ([c for c in controls if not c["is_enhancement"]], "Base controls"),
        ([c for c in controls if c["is_enhancement"]],     "Enhancements"),
    ]:
        lines.append(f"-- {label}")
        lines.append(f"INSERT INTO nist_controls {col} VALUES")
        rows = [
            f"  ({q(c['control_id'])}, {q(c['family_id'])}, {q(c['number'])}, "
            f"{q(c['title'])}, {q(c['description'])}, {q(c['guidance'])}, "
            f"{'TRUE' if c['is_enhancement'] else 'FALSE'}, {q(c['parent_id'])})"
            for c in group
        ]
        lines.append(",\n".join(rows) + ";")
        lines.append("")

    (out_dir / "03-nist-controls.sql").write_text("\n".join(lines) + "\n")


def write_baselines(baseline_ids: dict[str, set], out_dir: Path):
    lines = _header("NIST SP 800-53 Baseline Assignments (low / moderate / high)")
    lines.append("INSERT INTO nist_baselines (control_id, level) VALUES")
    rows = [
        f"  ({q(cid)}, {q(level)})"
        for level in ("low", "moderate", "high")
        for cid in sorted(baseline_ids[level])
    ]
    lines.append(",\n".join(rows) + ";")
    (out_dir / "04-nist-baselines.sql").write_text("\n".join(lines) + "\n")


def write_params(params: list[dict], out_dir: Path):
    lines = _header("NIST SP 800-53 Organization-Defined Parameters")
    lines.append("INSERT INTO nist_params (control_id, param_id, label) VALUES")
    rows = [f"  ({q(p['control_id'])}, {q(p['param_id'])}, {q(p['label'])})" for p in params]
    lines.append(",\n".join(rows) + ";")
    (out_dir / "05-nist-params.sql").write_text("\n".join(lines) + "\n")


def write_related(related: list[dict], out_dir: Path):
    lines = _header("NIST SP 800-53 Related Control Mappings")
    lines.append("INSERT INTO nist_related_controls (control_id, related_id) VALUES")
    rows = [f"  ({q(r['control_id'])}, {q(r['related_id'])})" for r in related]
    lines.append(",\n".join(rows) + ";")
    (out_dir / "06-nist-related-controls.sql").write_text("\n".join(lines) + "\n")


def write_catalog_version(catalog: dict, source_hash: str, out_dir: Path):
    version = catalog["metadata"]["version"]
    last_modified = catalog["metadata"]["last-modified"]
    lines = _header("NIST SP 800-53 Catalog Version Record")
    lines += [
        "INSERT INTO catalog_versions (catalog_name, version, source_hash, applied_at, migration_type, notes) VALUES",
        f"  ('nist-800-53', {q(version)}, {q(source_hash)}, NOW(), 'seed',",
        f"   {q(f'NIST SP 800-53 Rev 5 v{version} — source last modified {last_modified}')});",
    ]
    (out_dir / "09-catalog-version.sql").write_text("\n".join(lines) + "\n")


# ── main ──────────────────────────────────────────────────────────────────────

def main():
    SEED_DIR.mkdir(parents=True, exist_ok=True)

    print(f"Loading catalog: {CATALOG_FILE.name}")
    catalog = load_catalog(CATALOG_FILE)
    source_hash = file_sha256(CATALOG_FILE)
    version = catalog["metadata"]["version"]
    print(f"  Version    : {version}")
    print(f"  SHA-256    : {source_hash}")

    print("Extracting families...")
    families = extract_families(catalog)
    print(f"  {len(families)} families")

    print("Extracting controls...")
    controls = extract_controls(catalog)
    base_count = sum(1 for c in controls if not c["is_enhancement"])
    enh_count  = sum(1 for c in controls if c["is_enhancement"])
    print(f"  {base_count} base controls, {enh_count} enhancements ({len(controls)} total)")

    print("Extracting params...")
    params = extract_params(catalog)
    print(f"  {len(params)} params")

    print("Extracting related controls...")
    related = extract_related(catalog)
    print(f"  {len(related)} relationships")

    print("Loading baselines...")
    baseline_ids = {}
    for level, path in BASELINE_FILES.items():
        ids = extract_baseline_ids(path)
        baseline_ids[level] = ids
        print(f"  {level:10s}: {len(ids)} controls")

    print("Writing SQL seed files...")
    write_families(families, SEED_DIR)
    write_controls(controls, SEED_DIR)
    write_baselines(baseline_ids, SEED_DIR)
    write_params(params, SEED_DIR)
    write_related(related, SEED_DIR)
    write_catalog_version(catalog, source_hash, SEED_DIR)

    print("\nDone. Generated files:")
    for f in sorted(SEED_DIR.glob("0*.sql")):
        size_kb = f.stat().st_size // 1024
        print(f"  {f.name}  ({size_kb} KB)")


if __name__ == "__main__":
    main()
