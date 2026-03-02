#!/usr/bin/env bash
# Seed (or re-seed) the RDS database with all reference data.
# Drops and recreates all tables, then loads all seed files in order.
#
# Usage: ./scripts/seed_rds.sh [environment]
# Default environment: dev
#
# Requires: psql, aws CLI with access to Secrets Manager

set -euo pipefail

ENV=${1:-dev}
REGION="us-west-2"
SECRET_NAME="grc/${ENV}/db-credentials"

echo "Fetching DB credentials from Secrets Manager (${SECRET_NAME})..."
SECRET=$(aws secretsmanager get-secret-value \
  --secret-id "$SECRET_NAME" \
  --region "$REGION" \
  --query 'SecretString' --output text)

export PGHOST=$(echo "$SECRET" | python3 -c "import json,sys; print(json.load(sys.stdin)['host'])")
export PGUSER=$(echo "$SECRET" | python3 -c "import json,sys; print(json.load(sys.stdin)['username'])")
export PGPASSWORD=$(echo "$SECRET" | python3 -c "import json,sys; print(json.load(sys.stdin)['password'])")
export PGDATABASE="grcplatform"

echo "Connected to ${PGHOST}."

echo "Dropping existing tables..."
psql -c "
DROP TABLE IF EXISTS crosswalk_mappings CASCADE;
DROP TABLE IF EXISTS ai_rmf_subcategories CASCADE;
DROP TABLE IF EXISTS ai_rmf_categories CASCADE;
DROP TABLE IF EXISTS ai_rmf_functions CASCADE;
DROP TABLE IF EXISTS nist_related_controls CASCADE;
DROP TABLE IF EXISTS nist_params CASCADE;
DROP TABLE IF EXISTS nist_baselines CASCADE;
DROP TABLE IF EXISTS nist_controls CASCADE;
DROP TABLE IF EXISTS nist_families CASCADE;
DROP TABLE IF EXISTS catalog_versions CASCADE;
" -q

echo "Applying schema..."
psql -f core/db/schema.sql -q

echo "Loading seed files..."
for f in core/db/seed/02-nist-families.sql \
          core/db/seed/03-nist-controls.sql \
          core/db/seed/04-nist-baselines.sql \
          core/db/seed/05-nist-params.sql \
          core/db/seed/06-nist-related-controls.sql \
          core/db/seed/09-catalog-version.sql \
          core/db/seed/10-ai-rmf-functions.sql \
          core/db/seed/11-ai-rmf-categories.sql \
          core/db/seed/12-ai-rmf-subcategories.sql \
          core/db/seed/20-crosswalk-ac.sql \
          core/db/seed/21-crosswalk-au.sql \
          core/db/seed/22-crosswalk-ca.sql \
          core/db/seed/23-crosswalk-ra.sql \
          core/db/seed/24-crosswalk-sa.sql; do
  psql -f "$f" -q && echo "  OK: $f"
done

echo "Verifying row counts..."
psql -c "
SELECT 'nist_controls' AS table, COUNT(*) AS rows FROM nist_controls
UNION ALL SELECT 'nist_baselines', COUNT(*) FROM nist_baselines
UNION ALL SELECT 'ai_rmf_subcategories', COUNT(*) FROM ai_rmf_subcategories
UNION ALL SELECT 'crosswalk_mappings', COUNT(*) FROM crosswalk_mappings
ORDER BY table;
"

echo "Done. RDS seeded successfully."
