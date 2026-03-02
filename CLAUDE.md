# CLAUDE.md — GRC Platform Project Context

## Project Overview

An AI-native GRC (Governance, Risk, and Compliance) platform that exposes NIST SP 800-53 Rev 5 controls and NIST AI Risk Management Framework crosswalk data via the Model Context Protocol (MCP). Designed for dual deployment: Docker Compose (quick start) and AWS CloudFormation (production).

**Repo:** <https://github.com/gregsonier08/grc-platform>
**Docker Hub:** `gregsonier01/grc_platform` (multi-platform: amd64 + arm64)
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

PostgreSQL. Schema defined in `core/db/schema.sql`. Seed data in `core/db/seed/`. Docker init handled by `core/db/initdb.sh` (shell entry point that runs schema then all seed files in order).

### Deployment Paths

| Path               | Location         | Method                                                               |
|--------------------|------------------|----------------------------------------------------------------------|
| Docker Compose     | `deploy/docker/` | `docker compose up -d` — pulls pre-built image from Docker Hub       |
| AWS CloudFormation | `deploy/aws/`    | CloudFormation template (not yet built) — RDS + Lambda + API Gateway |

---

## Current State

### Phase 1 — Complete and Working

- **Docker Compose deployment**: Fully tested end-to-end. `docker compose up -d` pulls the pre-built image, initializes Postgres with all seed data, and starts the MCP server. Verified with live `tools/call` against AC-2.
- **Docker Hub image**: `gregsonier01/grc_platform:latest` — multi-platform (linux/amd64 + linux/arm64). Auto-publishes via GitHub Actions on push to main when `core/mcp-server/**` changes.
- **GitHub Actions**:
  - `publish-docker.yml` — builds and pushes multi-platform image to Docker Hub
  - `sync-nist.yml` — weekly NIST catalog sync (Monday 9AM UTC), opens PR if changed
- **Branch protection**: Ruleset applied — PRs required, 1 approval, Admin bypass allowed
- **Database tables (Phase 1 — populated in Docker)**:
  - `nist_families` — 20 control families
  - `nist_controls` — 324 base controls + 872 enhancements
  - `nist_baselines` — 806 baseline assignments (low/moderate/high)
  - `nist_params` — 1,600 organization-defined parameters
  - `nist_related_controls` — 3,512 control relationships
  - `catalog_versions` — tracks which NIST version is loaded
- **MCP tools (Phase 1 — working)**:
  - `get_control(control_id)` — Full control with enhancements, baselines, related controls, params
  - `get_control_family(family)` — All controls in a family
  - `get_baseline(level)` — All base controls at a baseline level

### Phase 2 — Complete and Working

- **Database tables** — all seeded in Docker and RDS:
  - `ai_rmf_functions` — 4 functions (GOVERN, MAP, MEASURE, MANAGE)
  - `ai_rmf_categories` — 19 categories
  - `ai_rmf_subcategories` — 72 subcategories with full descriptions
  - `crosswalk_mappings` — 211 mappings across AC, AU, CA, RA, SA families; 70 of 72 subcategories covered (2 genuine framework gaps)
- **MCP tools (Phase 2 — live in Docker and Lambda)**:
  - `get_ai_rmf_subcategory(subcategory_id)` — Look up subcategory with parent info
  - `get_crosswalk(subcategory_id)` — Get 800-53 controls mapped to an AI RMF subcategory
  - `get_crosswalk_by_family(family)` — Get all AI RMF mappings for an 800-53 family
  - `get_crosswalk_gaps(function?)` — Find unmapped AI RMF subcategories
- **Coverage gaps** (intentional — no 800-53 equivalent exists):
  - `MEASURE 2.2` — Human subjects evaluation requirements (IRB/informed consent)
  - `MEASURE 2.12` — Environmental impact and sustainability of AI model training

### AWS — Live (Manual Setup, Not Yet Codified)

- **Live AWS deployment** — all 7 MCP tools verified working:
  - API Gateway endpoint: `https://0tdx0fif8b.execute-api.us-west-2.amazonaws.com/mcp`
  - Lambda: `grc-dev-mcp-server` — handler `src.lambda_handler.handler` (modular `src/` package)
  - RDS endpoint: `grc-dev-db.cbtyvi6qukg0.us-west-2.rds.amazonaws.com`
  - Database name: `grcplatform`, Admin user: `grcadmin`
  - VPC: `grc-dev-vpc` (vpc-058442a39bf1c121d, 10.0.0.0/16)
  - Security group: `grc-dev-rds-sg` (sg-06b2f289d5824ace9)
- **Original Lambda handler**: `core/mcp-server/handler_original.py` (reference only — no longer deployed)
- **CloudFormation template**: Not yet built (`deploy/aws/template.yaml`)

---

## Key Design Decisions

1. **Python stack** — pg8000 for database, FastAPI+uvicorn for Docker HTTP server, Mangum not needed (Lambda uses direct handler)
2. **Connection strategy** — `db.py` checks DATABASE_URL first (Docker), then individual env vars, then AWS Secrets Manager (Lambda). No code changes between deployment paths.
3. **Tool registration is explicit** — Adding a new MCP tool requires: (a) define schema in tools.py, (b) write handler in handlers.py, (c) add to TOOL_DISPATCH dict, (d) add to ALL_TOOLS list. The MCP server does not auto-discover database tables.
4. **Crosswalk data is universal** — Not organization-specific. No environment-specific tool names, vendor names, or team references in implementation guidance. Uses generic terms (e.g., "SIEM" not "DataDog", "IdP" not "Okta").
5. **Self-hosted model priorities** (ranked): Ease of deployment > Customer data isolation > Update pushability > Cloud portability. This means we lean AWS-native and don't abstract for multi-cloud.
6. **Pre-built Docker image** — MCP server image published to Docker Hub. Customers `docker compose up -d` without needing to build locally.
7. **`.env` file approach** — Customers copy `.env.example` to `.env` and set their own password. Never committed. Password is set once on first Postgres init; changing it requires `docker compose down -v` to wipe the volume.

---

## Project Structure

``` text
grc-platform/
├── CLAUDE.md                           # This file
├── README.md                           # Project overview + quick start
├── .gitignore
├── .github/
│   ├── workflows/
│   │   ├── publish-docker.yml          # Build + push multi-platform image to Docker Hub
│   │   └── sync-nist.yml               # Weekly NIST catalog sync
│   └── rulesets/
│       └── main-protection.json        # Branch protection ruleset
├── core/
│   ├── db/
│   │   ├── schema.sql                  # All table definitions (Phase 1 + 2)
│   │   ├── initdb.sh                   # Docker Postgres init entry point
│   │   ├── sources/                    # NIST OSCAL JSON source files (v5.2.0)
│   │   ├── seed/                       # SQL insert files for reference data
│   │   └── migrations/                 # Delta SQL for upgrading existing deployments
│   └── mcp-server/
│       ├── handler_original.py         # Original single-file Lambda (reference only — no longer deployed)
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
│   │   ├── .env.example                # Copy to .env and set password before first run
│   │   └── README.md                   # Full Docker deployment guide
│   └── aws/
│       └── README.md                   # CloudFormation template not yet built
├── scripts/
│   ├── convert_nist_oscal.py           # OSCAL JSON → SQL seed files
│   ├── fetch_nist_sources.py           # Download + compare NIST sources from GitHub
│   └── generate_nist_migration.py      # Generate delta SQL for NIST catalog updates
└── docs/
    ├── architecture.md
    └── quickstart.md
```

---

## Next Steps (Priority Order)

1. **Build CloudFormation template** — `deploy/aws/template.yaml` codifying the existing manual AWS setup (Lambda + API Gateway + RDS + VPC/security groups)
2. **Expand crosswalk coverage** — Map additional 800-53 families (SI, CM, SC, IR, etc.) to close more AI RMF gaps
3. **Test Docker Compose from scratch** — Run `docker compose down -v && docker compose up -d` to verify all seed files load cleanly for new users

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

Set via `deploy/docker/.env` (copied from `.env.example`).

### AWS Lambda Path

``` text
DB_SECRET_ARN=arn:aws:secretsmanager:us-west-2:995433633495:secret:...
DB_HOST=grc-dev-db.cbtyvi6qukg0.us-west-2.rds.amazonaws.com
DB_NAME=grcplatform
ENVIRONMENT=dev
```

---

## Testing

### Start the local stack

```bash
cd deploy/docker
docker compose up -d
```

### Verify MCP tools

```bash
# Health check
curl http://localhost:8080/health

# tools/list
curl -s http://localhost:8080/mcp \
  -H "Content-Type: application/json" \
  -d '{"jsonrpc":"2.0","id":1,"method":"tools/list"}'

# tools/call — get a control
curl -s http://localhost:8080/mcp \
  -H "Content-Type: application/json" \
  -d '{"jsonrpc":"2.0","id":2,"method":"tools/call","params":{"name":"get_control","arguments":{"control_id":"AC-2"}}}'
```

### Tear down (preserves data volume)

```bash
docker compose down
```

### Tear down and wipe data (full reset)

```bash
docker compose down -v
```
