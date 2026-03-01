# CLAUDE.md — GRC Platform Project Context

## Project Overview

An AI-native GRC (Governance, Risk, and Compliance) platform that exposes NIST SP 800-53 Rev 5 controls and NIST AI Risk Management Framework crosswalk data via the Model Context Protocol (MCP). Designed for dual deployment: Docker Compose (quick start) and AWS CloudFormation (production).

**Repo:** <https://github.com/gregsonier08/grc-platform>
**Owner:** Greg Sonier

---

## Architecture

``` text
AI Client (Claude, etc.)
    │ MCP (JSON-RPC 2.0 over HTTP POST /mcp)
    ▼
MCP Server (Python)
    │ SQL via pg8000
    ▼
PostgreSQL Database
```

### MCP Server — Dual Entry Points, Shared Core

The server code lives in `core/mcp-server/src/`. The business logic is identical for both deployment paths — only the entry point differs:

- **`lambda_handler.py`** — AWS Lambda entry point (wraps dispatch in API Gateway proxy response format)
- **`server.py`** — FastAPI HTTP server entry point (Docker/local, runs via uvicorn on port 8080)
- **`dispatch.py`** — Shared routing logic (initialize, tools/list, tools/call)
- **`handlers.py`** — Tool implementation functions (SQL queries) + TOOL_DISPATCH dict
- **`tools.py`** — Tool definitions (name, description, inputSchema) + ALL_TOOLS list
- **`protocol.py`** — JSON-RPC 2.0 helpers (jsonrpc_success, jsonrpc_error, tool_result_content)
- **`db.py`** — Database connection management (auto-detects: DATABASE_URL → env vars → Secrets Manager)

### Database

PostgreSQL. Schema defined in `core/db/schema.sql`. Seed data in `core/db/seed/`.

### Deployment Paths

| Path               | Location         | Method                                                               |
|--------------------|------------------|----------------------------------------------------------------------|
| Docker Compose     | `deploy/docker/` | `docker compose up` — Postgres container + MCP server container      |
| AWS CloudFormation | `deploy/aws/`    | CloudFormation template (not yet built) — RDS + Lambda + API Gateway |

---

## Current State

### What Exists and Works

- **Live AWS deployment**: Lambda + API Gateway + RDS in us-west-2
  - RDS endpoint: `grc-dev-db.cbtyvi6qukg0.us-west-2.rds.amazonaws.com`
  - Database name: `grcplatform`
  - Admin user: `grcadmin`
  - VPC: `grc-dev-vpc` (vpc-058442a39bf1c121d, 10.0.0.0/16)
  - Security group: `grc-dev-rds-sg` (sg-06b2f289d5824ace9)
  - Internet gateway attached, publicly accessible, PGAdmin connectivity confirmed
- **Database tables (Phase 1 — populated)**:
  - `nist_families` — 20 control families
  - `nist_controls` — Full 800-53 Rev 5 catalog (~1200 controls + enhancements)
  - `nist_baselines` — Low/moderate/high assignments (177 controls at moderate)
  - `nist_params` — Organization-defined parameters
  - `nist_related_controls` — Control relationships
- **MCP tools (Phase 1 — live)**:
  - `get_control(control_id)` — Full control with enhancements, baselines, related controls, params
  - `get_control_family(family)` — All controls in a family
  - `get_baseline(level)` — All base controls at a baseline level
- **Original Lambda handler**: `core/mcp-server/handler_original.py` (single-file version currently deployed)

### What Needs to Be Built

- **Database tables (Phase 2 — schema defined, not yet created in RDS)**:
  - `ai_rmf_functions` — GOVERN, MAP, MEASURE, MANAGE
  - `ai_rmf_categories` — Category groupings (GOVERN 1, MAP 2, etc.)
  - `ai_rmf_subcategories` — 72 subcategories with descriptions
  - `crosswalk_mappings` — AI RMF ↔ 800-53 mappings with coverage level, rationale, guidance, evidence types
- **Seed data**: AI RMF subcategories and crosswalk mappings need to be generated as SQL insert files
  - AC family crosswalk data exists in a spreadsheet (24 mappings, environment-agnostic)
  - AU, CA, RA, SA families not yet mapped
  - Existing NIST 800-53 data needs to be exported from RDS as seed SQL files
- **MCP tools (Phase 2 — code written, not yet deployed)**:
  - `get_ai_rmf_subcategory(subcategory_id)` — Look up subcategory with parent info
  - `get_crosswalk(subcategory_id)` — Get 800-53 controls mapped to an AI RMF subcategory
  - `get_crosswalk_by_family(family)` — Get all AI RMF mappings for an 800-53 family
  - `get_crosswalk_gaps(function?)` — Find unmapped AI RMF subcategories
- **AWS CloudFormation template** — `deploy/aws/template.yaml` (not yet created)
- **Lambda deployment**: Refactored modular code needs to replace the single-file handler
- **Seed SQL export**: Dump existing RDS data into `core/db/seed/` files for Docker path

---

## Key Design Decisions

1. **Python stack** — pg8000 for database, FastAPI+uvicorn for Docker HTTP server, Mangum not needed (Lambda uses direct handler)
2. **Connection strategy** — `db.py` checks DATABASE_URL first (Docker), then individual env vars, then AWS Secrets Manager (Lambda). No code changes between deployment paths.
3. **Tool registration is explicit** — Adding a new MCP tool requires: (a) define schema in tools.py, (b) write handler in handlers.py, (c) add to TOOL_DISPATCH dict, (d) add to ALL_TOOLS list. The MCP server does not auto-discover database tables.
4. **Crosswalk data is universal** — Not organization-specific. No environment-specific tool names, vendor names, or team references in implementation guidance. Uses generic terms (e.g., "SIEM" not "DataDog", "IdP" not "Okta").
5. **Self-hosted model priorities** (ranked): Ease of deployment > Customer data isolation > Update pushability > Cloud portability. This means we lean AWS-native and don't abstract for multi-cloud.

---

## Project Structure

``` text
grc-platform/
├── CLAUDE.md                           # This file
├── README.md                           # Project overview + quick start
├── .gitignore
├── core/
│   ├── db/
│   │   ├── schema.sql                  # All table definitions (Phase 1 + 2)
│   │   ├── seed/                       # SQL insert files for reference data
│   │   │   ├── README.md
│   │   │   └── 10-ai-rmf-functions.sql # Sample seed file
│   │   └── migrations/
│   │       └── README.md
│   └── mcp-server/
│       ├── handler_original.py         # Original single-file Lambda (reference)
│       ├── Dockerfile
│       ├── requirements.txt            # pg8000, fastapi, uvicorn, boto3
│       └── src/
│           ├── __init__.py
│           ├── db.py                   # Connection management
│           ├── dispatch.py             # MCP method routing
│           ├── handlers.py             # Tool SQL implementations
│           ├── lambda_handler.py       # AWS Lambda entry point
│           ├── protocol.py             # JSON-RPC 2.0 helpers
│           ├── server.py               # FastAPI HTTP entry point
│           └── tools.py                # Tool definitions + ALL_TOOLS
├── deploy/
│   ├── docker/
│   │   ├── docker-compose.yml          # Postgres + MCP server containers
│   │   ├── .env.example
│   │   └── README.md
│   └── aws/
│       └── README.md                   # Template not yet built
└── docs/
    ├── architecture.md
    └── quickstart.md
```

---

## Next Steps (Priority Order)

1. **Create Phase 2 tables in RDS** — Run the ai_rmf_* and crosswalk_mappings DDL from schema.sql against grc-dev-db
2. **Generate and load seed data**:
   - Export existing NIST 800-53 data from RDS into seed SQL files
   - Create the full 72 AI RMF subcategory seed data
   - Convert AC family crosswalk spreadsheet data into seed SQL
3. **Expand crosswalk mappings** — Map AU, CA, RA, SA families to AI RMF (these close the biggest coverage gaps, especially MEASURE at 0%)
4. **Deploy refactored Lambda** — Replace handler_original.py with the modular src/ package
5. **Build CloudFormation template** — `deploy/aws/template.yaml` codifying the existing manual AWS setup
6. **Test Docker Compose path** — Verify the full Docker deployment works end-to-end with seed data

---

## Conventions

- **SQL style**: Lowercase table/column names, snake_case, VARCHAR for IDs, TEXT for long content
- **Control IDs**: Stored lowercase in DB (`ac-2`), displayed uppercase in labels (`AC-2`)
- **AI RMF IDs**: Stored as-is (`GOVERN 1.1`, `MAP 2.3`) — space-separated function + number
- **Coverage levels**: Direct, Strong, Partial, Supportive (defined in crosswalk_mappings)
- **Seed file numbering**: 02-09 NIST data, 10-19 AI RMF data, 20-29 crosswalk data
- **Python**: Use pg8000.native with named parameters (`:param` style)

---

## Environment Variables

### Docker Path

``` text
DATABASE_URL=postgresql://grcadmin:password@db:5432/grcplatform
PORT=8080
```

### AWS Lambda Path

``` text
DB_SECRET_ARN=arn:aws:secretsmanager:us-west-2:995433633495:secret:...
DB_HOST=grc-dev-db.cbtyvi6qukg0.us-west-2.rds.amazonaws.com
DB_NAME=grcplatform
ENVIRONMENT=dev
```

---

## Testing

To verify MCP tools work:

```bash
# tools/list
curl -s http://localhost:8080/mcp \
  -H "Content-Type: application/json" \
  -d '{"jsonrpc":"2.0","id":1,"method":"tools/list"}'

# tools/call — get a control
curl -s http://localhost:8080/mcp \
  -H "Content-Type: application/json" \
  -d '{"jsonrpc":"2.0","id":2,"method":"tools/call","params":{"name":"get_control","arguments":{"control_id":"AC-2"}}}'
```
