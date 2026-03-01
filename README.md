# GRC Platform

An AI-native GRC (Governance, Risk, and Compliance) platform that exposes NIST SP 800-53 Rev 5 controls and NIST AI Risk Management Framework crosswalk data via the [Model Context Protocol (MCP)](https://modelcontextprotocol.io/).

Designed for AI clients such as Claude to query compliance controls, baselines, and AI risk mappings directly in conversation.

---

## Quick Start (Docker)

**Prerequisites:** Docker and Docker Compose installed.

```bash
# 1. Clone the repo
git clone https://github.com/gregsonier08/grc-platform.git
cd grc-platform

# 2. Configure environment
cp deploy/docker/.env.example deploy/docker/.env
# Edit .env and set a strong POSTGRES_PASSWORD

# 3. Start the stack
cd deploy/docker
docker compose up -d
```

The MCP server will be available at `http://localhost:8080/mcp`.

---

## Verify It's Working

```bash
# List available tools
curl -s http://localhost:8080/mcp \
  -H "Content-Type: application/json" \
  -d '{"jsonrpc":"2.0","id":1,"method":"tools/list"}' | jq .

# Look up a control
curl -s http://localhost:8080/mcp \
  -H "Content-Type: application/json" \
  -d '{"jsonrpc":"2.0","id":2,"method":"tools/call","params":{"name":"get_control","arguments":{"control_id":"AC-2"}}}' | jq .

# Get all moderate baseline controls
curl -s http://localhost:8080/mcp \
  -H "Content-Type: application/json" \
  -d '{"jsonrpc":"2.0","id":3,"method":"tools/call","params":{"name":"get_baseline","arguments":{"level":"moderate"}}}' | jq .
```

---

## MCP Tools

| Tool | Description |
| ---- | ----------- |
| `get_control(control_id)` | Full control with enhancements, baselines, related controls, and parameters |
| `get_control_family(family)` | All base controls in a family (e.g. `AC`, `AU`) |
| `get_baseline(level)` | All controls assigned to a baseline level (`low`, `moderate`, `high`) |

---

## Project Structure

```text
grc-platform/
├── core/
│   ├── db/
│   │   ├── schema.sql          # All table definitions
│   │   ├── sources/            # NIST OSCAL source JSON files (pre-positioned)
│   │   ├── seed/               # Generated SQL seed files (fresh install)
│   │   └── migrations/         # Delta SQL migrations (catalog updates)
│   └── mcp-server/
│       ├── Dockerfile
│       ├── requirements.txt
│       └── src/
│           ├── db.py           # Connection management
│           ├── dispatch.py     # MCP method routing
│           ├── handlers.py     # Tool SQL implementations
│           ├── protocol.py     # JSON-RPC 2.0 helpers
│           ├── server.py       # FastAPI entry point (Docker)
│           ├── lambda_handler.py # AWS Lambda entry point
│           └── tools.py        # Tool definitions
├── deploy/
│   ├── docker/                 # Docker Compose deployment
│   └── aws/                    # AWS CloudFormation deployment (coming soon)
├── scripts/
│   ├── convert_nist_oscal.py   # Converts OSCAL JSON → SQL seed files
│   ├── fetch_nist_sources.py   # Downloads latest NIST files, compares hashes
│   └── generate_nist_migration.py # Generates delta SQL migrations
└── .github/
    └── workflows/
        └── sync-nist.yml       # Weekly NIST catalog sync workflow
```

---

## NIST Catalog Sync

The NIST SP 800-53 catalog is pre-positioned in `core/db/sources/` as official OSCAL JSON files published by NIST. A GitHub Actions workflow runs weekly to detect updates:

1. Downloads the latest files from [usnistgov/oscal-content](https://github.com/usnistgov/oscal-content)
2. Compares SHA-256 hashes against the checked-in copies
3. If changed: generates a delta migration, regenerates seed files, and opens a PR for review

**For existing deployments:** apply the migration file from `core/db/migrations/`.
**For fresh installs:** the seed files in `core/db/seed/` always reflect the current catalog version.

To manually regenerate seed files from the source JSONs:

```bash
python scripts/convert_nist_oscal.py
```

---

## Connecting to Claude

Add this to your Claude MCP configuration:

```json
{
  "mcpServers": {
    "grc-platform": {
      "url": "http://localhost:8080/mcp"
    }
  }
}
```

---

## Roadmap

- [x] Phase 1: NIST SP 800-53 Rev 5 controls, baselines, parameters
- [ ] Phase 2: NIST AI RMF crosswalk mappings
- [ ] AWS CloudFormation deployment template
- [ ] Migration runner utility

---

## License

Apache 2.0
