"""MCP tool definitions (name, description, inputSchema)."""

ALL_TOOLS = [
    {
        "name": "get_control",
        "description": (
            "Look up a single NIST SP 800-53 Rev 5 control by its ID. "
            "Returns the full control text, guidance, enhancements, baselines, "
            "related controls, and organization-defined parameters."
        ),
        "inputSchema": {
            "type": "object",
            "properties": {
                "control_id": {
                    "type": "string",
                    "description": "Control identifier, e.g. 'AC-2' or 'ac-2'",
                }
            },
            "required": ["control_id"],
        },
    },
    {
        "name": "get_control_family",
        "description": (
            "Return all base controls (not enhancements) for a given NIST 800-53 "
            "control family, e.g. 'AC' for Access Control."
        ),
        "inputSchema": {
            "type": "object",
            "properties": {
                "family": {
                    "type": "string",
                    "description": "Two-letter family abbreviation, e.g. 'AC', 'AU', 'CA'",
                }
            },
            "required": ["family"],
        },
    },
    {
        "name": "get_baseline",
        "description": (
            "Return all base controls assigned to a NIST 800-53 baseline level "
            "(low, moderate, or high)."
        ),
        "inputSchema": {
            "type": "object",
            "properties": {
                "level": {
                    "type": "string",
                    "description": "Baseline level: 'low', 'moderate', or 'high'",
                    "enum": ["low", "moderate", "high"],
                }
            },
            "required": ["level"],
        },
    },
    {
        "name": "get_ai_rmf_subcategory",
        "description": (
            "Look up a single NIST AI RMF 1.0 subcategory by its ID. "
            "Returns the subcategory description along with its parent category and function."
        ),
        "inputSchema": {
            "type": "object",
            "properties": {
                "subcategory_id": {
                    "type": "string",
                    "description": "Subcategory ID, e.g. 'GOVERN 1.1' or 'MAP 2.3'",
                }
            },
            "required": ["subcategory_id"],
        },
    },
    {
        "name": "get_crosswalk",
        "description": (
            "Get all NIST SP 800-53 Rev 5 controls mapped to a given AI RMF 1.0 subcategory, "
            "including coverage level, mapping rationale, implementation guidance, and evidence types."
        ),
        "inputSchema": {
            "type": "object",
            "properties": {
                "subcategory_id": {
                    "type": "string",
                    "description": "AI RMF subcategory ID, e.g. 'GOVERN 1.1'",
                }
            },
            "required": ["subcategory_id"],
        },
    },
    {
        "name": "get_crosswalk_by_family",
        "description": (
            "Get all AI RMF 1.0 subcategory mappings for a given NIST 800-53 control family. "
            "Returns every mapped subcategory with coverage level, rationale, and guidance."
        ),
        "inputSchema": {
            "type": "object",
            "properties": {
                "family": {
                    "type": "string",
                    "description": "Two-letter family abbreviation, e.g. 'AC', 'AU', 'CA'",
                }
            },
            "required": ["family"],
        },
    },
    {
        "name": "search_controls",
        "description": (
            "Search NIST SP 800-53 Rev 5 controls by keyword. Searches across control "
            "titles, descriptions, and guidance text. Returns concise results (ID, title, "
            "family, match snippet). Use get_control() to retrieve full details for any match."
        ),
        "inputSchema": {
            "type": "object",
            "properties": {
                "query": {
                    "type": "string",
                    "description": "Search keyword or phrase, e.g. 'encryption', 'incident response', 'multi-factor'",
                },
                "limit": {
                    "type": "integer",
                    "description": "Maximum results to return (default 25, max 50)",
                },
            },
            "required": ["query"],
        },
    },
    {
        "name": "get_crosswalk_gaps",
        "description": (
            "Find AI RMF 1.0 subcategories that have no mapped NIST 800-53 controls, "
            "indicating coverage gaps. Optionally filter by AI RMF function."
        ),
        "inputSchema": {
            "type": "object",
            "properties": {
                "function": {
                    "type": "string",
                    "description": "Optional: filter by AI RMF function — GOVERN, MAP, MEASURE, or MANAGE",
                    "enum": ["GOVERN", "MAP", "MEASURE", "MANAGE"],
                }
            },
            "required": [],
        },
    },
]
