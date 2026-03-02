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


def handle_search_controls(arguments: dict) -> list:
    query = arguments["query"].strip()
    if not query:
        return tool_result_content("Search query cannot be empty.")

    limit = min(int(arguments.get("limit", 25)), 50)
    pattern = f"%{query}%"
    conn = get_connection()

    rows = conn.run(
        """
        SELECT c.control_id, c.title, f.abbreviation AS family,
               c.is_enhancement,
               CASE
                   WHEN c.title ILIKE :pat THEN 'title'
                   WHEN c.description ILIKE :pat THEN 'description'
                   ELSE 'guidance'
               END AS match_field,
               CASE
                   WHEN c.title ILIKE :pat THEN c.title
                   WHEN c.description ILIKE :pat THEN LEFT(c.description, 200)
                   ELSE LEFT(c.guidance, 200)
               END AS snippet
        FROM nist_controls c
        JOIN nist_families f ON f.family_id = c.family_id
        WHERE c.title ILIKE :pat
           OR c.description ILIKE :pat
           OR c.guidance ILIKE :pat
        ORDER BY
            CASE WHEN c.title ILIKE :pat THEN 0
                 WHEN c.description ILIKE :pat THEN 1
                 ELSE 2
            END,
            c.is_enhancement,
            c.control_id
        LIMIT :lim
        """,
        pat=pattern,
        lim=limit,
    )

    if not rows:
        return tool_result_content(f"No controls found matching '{query}'.")

    results = [
        {
            "control_id": r[0].upper(),
            "title": r[1],
            "family": r[2],
            "is_enhancement": r[3],
            "match_field": r[4],
            "snippet": r[5],
        }
        for r in rows
    ]
    result = {
        "query": query,
        "count": len(results),
        "results": results,
    }
    return tool_result_content(json.dumps(result, indent=2))


# ── Phase 2 handlers ─────────────────────────────────────────────────────────

def handle_get_ai_rmf_subcategory(arguments: dict) -> list:
    subcategory_id = arguments["subcategory_id"].strip()
    conn = get_connection()

    rows = conn.run(
        """
        SELECT s.subcategory_id, s.description,
               c.category_id, c.name AS category_name, c.description AS category_desc,
               f.function_id, f.name AS function_name, f.description AS function_desc
        FROM ai_rmf_subcategories s
        JOIN ai_rmf_categories c ON c.category_id = s.category_id
        JOIN ai_rmf_functions f ON f.function_id = c.function_id
        WHERE s.subcategory_id = :sid
        """,
        sid=subcategory_id,
    )
    if not rows:
        return tool_result_content(f"AI RMF subcategory '{subcategory_id}' not found.")

    r = rows[0]
    result = {
        "subcategory_id": r[0],
        "description": r[1],
        "category": {
            "category_id": r[2],
            "name": r[3],
            "description": r[4],
        },
        "function": {
            "function_id": r[5],
            "name": r[6],
            "description": r[7],
        },
    }
    return tool_result_content(json.dumps(result, indent=2))


def handle_get_crosswalk(arguments: dict) -> list:
    subcategory_id = arguments["subcategory_id"].strip()
    conn = get_connection()

    rows = conn.run(
        """
        SELECT m.control_id, c.title, f.abbreviation AS family,
               m.coverage_level, m.rationale, m.guidance, m.evidence_types
        FROM crosswalk_mappings m
        JOIN nist_controls c ON c.control_id = m.control_id
        JOIN nist_families f ON f.family_id = c.family_id
        WHERE m.subcategory_id = :sid
        ORDER BY m.coverage_level, m.control_id
        """,
        sid=subcategory_id,
    )
    if not rows:
        return tool_result_content(
            f"No crosswalk mappings found for subcategory '{subcategory_id}'."
        )

    mappings = [
        {
            "control_id": r[0].upper(),
            "title": r[1],
            "family": r[2],
            "coverage_level": r[3],
            "rationale": r[4],
            "guidance": r[5],
            "evidence_types": r[6] or [],
        }
        for r in rows
    ]
    return tool_result_content(json.dumps(mappings, indent=2))


def handle_get_crosswalk_by_family(arguments: dict) -> list:
    family = _normalize_family(arguments["family"])
    conn = get_connection()

    rows = conn.run(
        """
        SELECT m.subcategory_id, m.control_id, c.title,
               m.coverage_level, m.rationale, m.guidance, m.evidence_types,
               s.description AS subcategory_desc,
               cat.name AS category_name,
               fn.function_id
        FROM crosswalk_mappings m
        JOIN nist_controls c ON c.control_id = m.control_id
        JOIN nist_families f ON f.family_id = c.family_id
        JOIN ai_rmf_subcategories s ON s.subcategory_id = m.subcategory_id
        JOIN ai_rmf_categories cat ON cat.category_id = s.category_id
        JOIN ai_rmf_functions fn ON fn.function_id = cat.function_id
        WHERE f.family_id = :fam
        ORDER BY m.subcategory_id, m.control_id
        """,
        fam=family,
    )
    if not rows:
        return tool_result_content(
            f"No crosswalk mappings found for family '{family.upper()}'."
        )

    mappings = [
        {
            "subcategory_id": r[0],
            "subcategory_description": r[7],
            "ai_rmf_function": r[9],
            "ai_rmf_category": r[8],
            "control_id": r[1].upper(),
            "control_title": r[2],
            "coverage_level": r[3],
            "rationale": r[4],
            "guidance": r[5],
            "evidence_types": r[6] or [],
        }
        for r in rows
    ]
    return tool_result_content(json.dumps(mappings, indent=2))


def handle_get_crosswalk_gaps(arguments: dict) -> list:
    function_filter = (arguments.get("function") or "").strip().upper() or None
    conn = get_connection()

    if function_filter:
        rows = conn.run(
            """
            SELECT s.subcategory_id, s.description,
                   c.category_id, c.name AS category_name, f.function_id
            FROM ai_rmf_subcategories s
            JOIN ai_rmf_categories c ON c.category_id = s.category_id
            JOIN ai_rmf_functions f ON f.function_id = c.function_id
            WHERE f.function_id = :fn
              AND NOT EXISTS (
                  SELECT 1 FROM crosswalk_mappings m
                  WHERE m.subcategory_id = s.subcategory_id
              )
            ORDER BY s.subcategory_id
            """,
            fn=function_filter,
        )
    else:
        rows = conn.run(
            """
            SELECT s.subcategory_id, s.description,
                   c.category_id, c.name AS category_name, f.function_id
            FROM ai_rmf_subcategories s
            JOIN ai_rmf_categories c ON c.category_id = s.category_id
            JOIN ai_rmf_functions f ON f.function_id = c.function_id
            WHERE NOT EXISTS (
                SELECT 1 FROM crosswalk_mappings m
                WHERE m.subcategory_id = s.subcategory_id
            )
            ORDER BY s.subcategory_id
            """
        )

    gaps = [
        {
            "subcategory_id": r[0],
            "description": r[1],
            "category_id": r[2],
            "category_name": r[3],
            "function": r[4],
        }
        for r in rows
    ]
    summary = f"{len(gaps)} unmapped subcategories"
    if function_filter:
        summary += f" in {function_filter}"
    result = {"summary": summary, "gaps": gaps}
    return tool_result_content(json.dumps(result, indent=2))


# ── dispatch table ────────────────────────────────────────────────────────────

TOOL_DISPATCH = {
    "get_control": handle_get_control,
    "get_control_family": handle_get_control_family,
    "get_baseline": handle_get_baseline,
    "search_controls": handle_search_controls,
    "get_ai_rmf_subcategory": handle_get_ai_rmf_subcategory,
    "get_crosswalk": handle_get_crosswalk,
    "get_crosswalk_by_family": handle_get_crosswalk_by_family,
    "get_crosswalk_gaps": handle_get_crosswalk_gaps,
}
