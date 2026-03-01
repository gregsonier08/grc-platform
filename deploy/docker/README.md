# Docker Deployment Guide

This guide walks through standing up the GRC Platform locally using Docker Compose. No Python or PostgreSQL installation is required — everything runs inside containers.

---

## Prerequisites

- **Docker Desktop 4.x+** (includes Docker Compose v2)
- **Node.js** (only needed if connecting to Claude Desktop via `mcp-remote`)
- **Git**

Verify your Docker installation:

```bash
docker --version          # Docker version 24.x or higher
docker compose version    # Docker Compose version v2.x or higher
```

> **Note:** This guide uses `docker compose` (v2). If your system only has `docker-compose` (v1), upgrade Docker Desktop.

---

## First-Time Setup

### 1. Clone the repository

```bash
git clone https://github.com/gregsonier08/grc-platform.git
cd grc-platform
```

### 2. Configure environment variables

```bash
cp deploy/docker/.env.example deploy/docker/.env
```

Open `deploy/docker/.env` and replace the placeholder password:

```text
POSTGRES_USER=grcadmin
POSTGRES_PASSWORD=your-strong-password-here     ← change this
POSTGRES_DB=grcplatform

DATABASE_URL=postgresql://grcadmin:your-strong-password-here@db:5432/grcplatform
                                  ↑ must match POSTGRES_PASSWORD above
```

> The password appears in two places — `POSTGRES_PASSWORD` and inside `DATABASE_URL`. Both must match.

### 3. Start the stack

```bash
cd deploy/docker
docker compose up -d
```

The first start takes a minute or two. Docker will:

1. Pull the Postgres 16 image and the pre-built `gregsonier01/grc_platform` MCP server image
2. Start Postgres and run the initialization scripts — this loads the full NIST SP 800-53 Rev 5 catalog (~1,200 controls, baselines, parameters, and related control mappings) automatically

### 4. Verify the stack is running

```bash
docker compose ps
```

Both services should show `healthy` / `running`:

```text
NAME            STATUS
docker-db-1     running (healthy)
docker-mcp-1    running
```

### 5. Test the MCP server

```bash
curl -s http://localhost:8080/mcp \
  -H "Content-Type: application/json" \
  -d '{"jsonrpc":"2.0","id":1,"method":"tools/list"}' | python3 -m json.tool
```

You should see three tools listed: `get_control`, `get_control_family`, and `get_baseline`.

---

## Connecting to Claude Desktop

### 1. Install mcp-remote (one time)

```bash
npx -y mcp-remote@latest --help
```

Running this once ensures the package is cached locally.

### 2. Edit Claude Desktop configuration

Open (or create) the Claude Desktop config file:

- **macOS:** `~/Library/Application Support/Claude/claude_desktop_config.json`
- **Windows:** `%APPDATA%\Claude\claude_desktop_config.json`

Add the `grc-platform` entry to `mcpServers`:

```json
{
  "mcpServers": {
    "grc-platform": {
      "command": "npx",
      "args": [
        "-y",
        "mcp-remote@latest",
        "http://localhost:8080/mcp",
        "--transport",
        "http-first"
      ]
    }
  }
}
```

### 3. Restart Claude Desktop

Quit and relaunch Claude Desktop. The GRC Platform tools will appear in the tool picker. You can now ask Claude questions like:

- *"What does NIST control AC-2 require?"*
- *"List all controls in the AU family."*
- *"What controls are in the moderate baseline?"*

---

## Day-to-Day Operations

### Start the stack

```bash
cd deploy/docker
docker compose up -d
```

### Stop the stack (data is preserved)

```bash
docker compose down
```

### View logs

```bash
docker compose logs -f          # all services
docker compose logs -f db       # Postgres only
docker compose logs -f mcp      # MCP server only
```

### Reset completely (destroys all data)

```bash
docker compose down -v
```

This removes the Postgres data volume. The next `docker compose up` will re-initialize from scratch, reloading all seed data.

---

## Applying NIST Catalog Updates

When a `nist-sync` pull request is merged in the repository, existing deployments need to apply the delta migration — they cannot simply restart, as the database already contains data.

### Steps

1. Pull the latest changes:

    ```bash
    git pull origin main
    ```

2. Identify the new migration file in `core/db/migrations/`. It will be named with a timestamp and version, e.g.:

    ```text
    core/db/migrations/20250915_090000_nist-800-53_5.2.0_to_5.3.0.sql
    ```

3. Apply the migration against the running database:

    ```bash
    docker compose exec db psql \
      -U grcadmin \
      -d grcplatform \
      -f /dev/stdin < ../../core/db/migrations/20250915_090000_nist-800-53_5.2.0_to_5.3.0.sql
    ```

    Or copy the file into the container first:

    ```bash
    docker compose cp ../../core/db/migrations/20250915_090000_nist-800-53_5.2.0_to_5.3.0.sql db:/tmp/migration.sql
    docker compose exec db psql -U grcadmin -d grcplatform -f /tmp/migration.sql
    ```

4. Verify the version table was updated:

    ```bash
    docker compose exec db psql -U grcadmin -d grcplatform \
      -c "SELECT catalog_name, version, applied_at, migration_type FROM catalog_versions ORDER BY applied_at;"
    ```

---

## Troubleshooting

**MCP server can't connect to the database**
The MCP container waits for Postgres to be healthy before starting, but if the database is slow to initialize (large seed load), it may time out. Run `docker compose up -d` again — it will restart only the containers that need it.

**Port 8080 or 5432 already in use**
Another process is using that port. Either stop it or change the port mappings in `docker-compose.yml`:

```yaml
ports:
  - "8081:8080"   # change left side only
```

Then update `http://localhost:8080/mcp` to `http://localhost:8081/mcp` in your Claude Desktop config.

**Database looks empty after startup**
Check the Postgres init logs for errors:

```bash
docker compose logs db | grep -E "ERROR|FATAL|==>"
```

If the init script failed partway through, reset and try again:

```bash
docker compose down -v && docker compose up -d
```
