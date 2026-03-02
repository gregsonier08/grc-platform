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

- **`lambda_handler.py`** — AWS Lambda entry point (API key auth + API Gateway proxy response format)
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
| AWS CloudFormation | `deploy/aws/`    | 3 CloudFormation stacks — VPC + RDS + Lambda/API Gateway             |

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
  - `crosswalk_mappings` — 666 mappings across all 20 control families (full quality); 70 of 72 subcategories covered
- **MCP tools (Phase 2 — live in Docker and Lambda)**:
  - `get_ai_rmf_subcategory(subcategory_id)` — Look up subcategory with parent info
  - `get_crosswalk(subcategory_id)` — Get 800-53 controls mapped to an AI RMF subcategory
  - `get_crosswalk_by_family(family)` — Get all AI RMF mappings for an 800-53 family
  - `get_crosswalk_gaps(function?)` — Find unmapped AI RMF subcategories
- **Coverage gaps** (intentional — no 800-53 equivalent exists):
  - `MEASURE 2.2` — Human subjects evaluation requirements (IRB/informed consent)
  - `MEASURE 2.12` — Environmental impact and sustainability of AI model training

### AWS — Live (Codified in CloudFormation)

- **Live AWS deployment** — all 7 MCP tools verified working:
  - API Gateway endpoint: `https://<YOUR-API-ID>.execute-api.us-west-2.amazonaws.com/mcp`
  - Lambda: `grc-dev-mcp-server` — handler `src.lambda_handler.handler` (modular `src/` package)
  - RDS endpoint: `grc-dev-db.<YOUR-RDS-ID>.us-west-2.rds.amazonaws.com`
  - Database name: `grcplatform`, Admin user: `grcadmin`
  - VPC: `grc-dev-vpc` (<YOUR-VPC-ID>, 10.0.0.0/16)
  - Security group: `grc-dev-rds-sg` (<YOUR-SG-ID>)
- **API key authentication** — MCP endpoint requires `x-api-key` header. Key stored as Lambda env var (`API_KEY`). Auth skipped when env var is empty (Docker/local path). Uses `hmac.compare_digest()` for timing-safe comparison.
- **CloudFormation stacks** (3 stacks in `deploy/aws/`):
  - `vpc.yaml` — VPC, private subnets, security groups, VPC endpoints
  - `data.yaml` — RDS PostgreSQL, Secrets Manager, S3
  - `compute.yaml` — Lambda (MCP server + OSCAL loader), API Gateway HTTP API, `ApiKey` parameter
- **OSCAL Loader Lambda** — `grc-dev-oscal-loader` reads seed SQL from S3, applies to RDS. Supports `reseed` (full reload) and `status` (check version) actions. Code in `core/oscal-loader/`.
- **Automated NIST updates** — `sync-nist.yml` opens PR on catalog changes (weekly). `apply-nist-update.yml` uploads seeds to S3 and invokes the loader after merge to `main`.
- **Deployment scripts** (`scripts/`):
  - `deploy_lambda.sh` — builds and uploads the MCP server `src/` package to Lambda
  - `deploy_oscal_loader.sh` — builds and uploads the OSCAL loader package to Lambda
  - `seed_rds.sh` — drops/recreates tables and loads all seed files into RDS
- **Original Lambda handler**: `core/mcp-server/handler_original.py` (reference only — no longer deployed)

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
│   │   ├── sync-nist.yml               # Weekly NIST catalog sync
│   │   └── apply-nist-update.yml       # Post-merge: upload seeds to S3, invoke OSCAL loader
│   └── rulesets/
│       └── main-protection.json        # Branch protection ruleset
├── core/
│   ├── db/
│   │   ├── schema.sql                  # All table definitions (Phase 1 + 2)
│   │   ├── initdb.sh                   # Docker Postgres init entry point
│   │   ├── sources/                    # NIST OSCAL JSON source files (v5.2.0)
│   │   ├── seed/                       # SQL insert files for reference data
│   │   └── migrations/                 # Delta SQL for upgrading existing deployments
│   ├── oscal-loader/
│   │   ├── handler.py                 # OSCAL Loader Lambda — reads seeds from S3, loads RDS
│   │   └── db.py                      # Connection management (copy of mcp-server/src/db.py)
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
│       ├── vpc.yaml                    # CloudFormation: VPC, subnets, security groups, endpoints
│       ├── data.yaml                   # CloudFormation: RDS, Secrets Manager, S3
│       ├── compute.yaml                # CloudFormation: Lambda, API Gateway
│       └── README.md                   # AWS deployment guide
├── scripts/
│   ├── convert_nist_oscal.py           # OSCAL JSON → SQL seed files
│   ├── fetch_nist_sources.py           # Download + compare NIST sources from GitHub
│   ├── generate_nist_migration.py      # Generate delta SQL for NIST catalog updates
│   ├── deploy_lambda.sh               # Build + deploy MCP server Lambda package
│   ├── deploy_oscal_loader.sh         # Build + deploy OSCAL loader Lambda package
│   └── seed_rds.sh                     # Drop/recreate tables + seed RDS
└── docs/
    ├── architecture.md
    └── quickstart.md
```

---

## Next Steps (Priority Order)

1. **Test Docker Compose from scratch** — Run `docker compose down -v && docker compose up -d` to verify all 20 crosswalk seed files load cleanly for new users
2. **Set up GitHub Actions AWS credentials** — Add `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` secrets to the GitHub repo for the `apply-nist-update.yml` workflow
3. **Add more MCP tools** — Search across controls, compare baselines, get enhancement details
4. **Add tests** — Unit tests for handlers, integration tests for the MCP endpoint

---

## Conventions

- **SQL style**: Lowercase table/column names, snake_case, VARCHAR for IDs, TEXT for long content
- **Control IDs**: Stored lowercase in DB (`ac-2`), displayed uppercase in labels (`AC-2`)
- **AI RMF IDs**: Stored as-is (`GOVERN 1.1`, `MAP 2.3`) — space-separated function + number
- **Coverage levels**: Direct, Strong, Partial, Supportive (defined in crosswalk_mappings)
- **Seed file numbering**: 02-09 NIST data, 10-19 AI RMF data, 20-39 crosswalk data (one file per 800-53 family)
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
DB_SECRET_ARN=arn:aws:secretsmanager:us-west-2:<YOUR-ACCOUNT-ID>:secret:...
DB_HOST=grc-dev-db.<YOUR-RDS-ID>.us-west-2.rds.amazonaws.com
DB_NAME=grcplatform
ENVIRONMENT=dev
API_KEY=<secret>  # Required — requests without valid x-api-key header get 403
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
