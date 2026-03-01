#!/bin/bash
# Postgres initdb entry point — runs schema then seed files in order.
# Mounted into /docker-entrypoint-initdb.d/ by Docker Compose.
set -e

echo "==> Applying schema..."
psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f /docker-initdb/schema.sql

echo "==> Loading seed files..."
for f in $(ls /docker-initdb/seed/*.sql | sort); do
    echo "    $f"
    psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f "$f"
done

echo "==> Database initialised."
