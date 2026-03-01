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
    # Phase 2 tools — uncomment once Phase 2 tables are populated
    # {
    #     "name": "get_ai_rmf_subcategory",
    #     "description": "Look up an AI RMF subcategory with its parent category and function.",
    #     "inputSchema": {
    #         "type": "object",
    #         "properties": {
    #             "subcategory_id": {
    #                 "type": "string",
    #                 "description": "Subcategory ID, e.g. 'GOVERN 1.1'",
    #             }
    #         },
    #         "required": ["subcategory_id"],
    #     },
    # },
    # {
    #     "name": "get_crosswalk",
    #     "description": "Get all NIST 800-53 controls mapped to an AI RMF subcategory.",
    #     "inputSchema": {
    #         "type": "object",
    #         "properties": {
    #             "subcategory_id": {
    #                 "type": "string",
    #                 "description": "AI RMF subcategory ID, e.g. 'GOVERN 1.1'",
    #             }
    #         },
    #         "required": ["subcategory_id"],
    #     },
    # },
    # {
    #     "name": "get_crosswalk_by_family",
    #     "description": "Get all AI RMF mappings for a given NIST 800-53 control family.",
    #     "inputSchema": {
    #         "type": "object",
    #         "properties": {
    #             "family": {
    #                 "type": "string",
    #                 "description": "Two-letter family abbreviation, e.g. 'AC'",
    #             }
    #         },
    #         "required": ["family"],
    #     },
    # },
    # {
    #     "name": "get_crosswalk_gaps",
    #     "description": "Find AI RMF subcategories with no mapped 800-53 controls.",
    #     "inputSchema": {
    #         "type": "object",
    #         "properties": {
    #             "function": {
    #                 "type": "string",
    #                 "description": "Optional: filter by AI RMF function (GOVERN, MAP, MEASURE, MANAGE)",
    #             }
    #         },
    #         "required": [],
    #     },
    # },
]
