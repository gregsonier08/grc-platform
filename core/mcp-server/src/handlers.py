"""Tool handler implementations — SQL queries against PostgreSQL."""

import json
from .db import get_connection
from .protocol import tool_result_content


# ── helpers ──────────────────────────────────────────────────────────────────

def _normalize_control_id(raw: str) -> str:
    """Accept 'AC-2' or 'ac-2' and return the lowercase DB form."""
    return raw.strip().lower()


def _normalize_family(raw: str) -> str:
    """Accept 'AC' or 'ac' and return the lowercase DB family_id."""
    return raw.strip().lower()


# ── Phase 1 handlers ─────────────────────────────────────────────────────────

def handle_get_control(arguments: dict) -> list:
    control_id = _normalize_control_id(arguments["control_id"])
    conn = get_connection()

    # Base control
    rows = conn.run(
        """
        SELECT c.control_id, c.title, c.description, c.guidance,
               c.is_enhancement, c.parent_id, f.abbreviation AS family
        FROM nist_controls c
        JOIN nist_families f ON f.family_id = c.family_id
        WHERE c.control_id = :cid
        """,
        cid=control_id,
    )
    if not rows:
        return tool_result_content(f"Control '{control_id.upper()}' not found.")

    ctrl = rows[0]
    cid, title, description, guidance, is_enh, parent_id, family = ctrl

    # Enhancements
    enhancements = conn.run(
        """
        SELECT control_id, title, description
        FROM nist_controls
        WHERE parent_id = :cid
        ORDER BY control_id
        """,
        cid=control_id,
    )

    # Baselines
    baselines = conn.run(
        "SELECT level FROM nist_baselines WHERE control_id = :cid ORDER BY level",
        cid=control_id,
    )

    # Related controls
    related = conn.run(
        "SELECT related_id FROM nist_related_controls WHERE control_id = :cid ORDER BY related_id",
        cid=control_id,
    )

    # Parameters
    params = conn.run(
        "SELECT param_id, label FROM nist_params WHERE control_id = :cid ORDER BY param_id",
        cid=control_id,
    )

    result = {
        "control_id": cid.upper(),
        "family": family,
        "title": title,
        "description": description,
        "guidance": guidance,
        "baselines": [r[0] for r in baselines],
        "related_controls": [r[0].upper() for r in related],
        "parameters": [{"id": r[0], "label": r[1]} for r in params],
        "enhancements": [
            {"control_id": r[0].upper(), "title": r[1], "description": r[2]}
            for r in enhancements
        ],
    }

    return tool_result_content(json.dumps(result, indent=2))


def handle_get_control_family(arguments: dict) -> list:
    family = _normalize_family(arguments["family"])
    conn = get_connection()

    rows = conn.run(
        """
        SELECT c.control_id, c.title, c.description
        FROM nist_controls c
        JOIN nist_families f ON f.family_id = c.family_id
        WHERE f.family_id = :fam
          AND c.is_enhancement = FALSE
        ORDER BY c.control_id
        """,
        fam=family,
    )

    if not rows:
        return tool_result_content(f"No controls found for family '{family.upper()}'.")

    controls = [
        {"control_id": r[0].upper(), "title": r[1], "description": r[2]}
        for r in rows
    ]
    return tool_result_content(json.dumps(controls, indent=2))


def handle_get_baseline(arguments: dict) -> list:
    level = arguments["level"].strip().lower()
    conn = get_connection()

    rows = conn.run(
        """
        SELECT c.control_id, c.title, f.abbreviation AS family
        FROM nist_baselines b
        JOIN nist_controls c ON c.control_id = b.control_id
        JOIN nist_families f ON f.family_id = c.family_id
        WHERE b.level = :lvl
          AND c.is_enhancement = FALSE
        ORDER BY c.control_id
        """,
        lvl=level,
    )

    if not rows:
        return tool_result_content(f"No controls found for baseline '{level}'.")

    controls = [
        {"control_id": r[0].upper(), "title": r[1], "family": r[2]}
        for r in rows
    ]
    return tool_result_content(json.dumps(controls, indent=2))


# ── dispatch table ────────────────────────────────────────────────────────────

TOOL_DISPATCH = {
    "get_control": handle_get_control,
    "get_control_family": handle_get_control_family,
    "get_baseline": handle_get_baseline,
}
