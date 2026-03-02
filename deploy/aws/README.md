# AWS Deployment

The GRC Platform AWS deployment uses three CloudFormation stacks deployed in order. Each stack exports values consumed by the next.

```text
vpc.yaml → data.yaml → compute.yaml
```

## Stack Overview

| Stack | Template | Resources |
| ------- | ---------- | ----------- |
| `grc-{env}-vpc` | `vpc.yaml` | VPC, private subnets (2 AZs), security groups, VPC endpoints |
| `grc-{env}-data` | `data.yaml` | RDS PostgreSQL (t4g.micro), Secrets Manager, S3 (OSCAL data) |
| `grc-{env}-compute` | `compute.yaml` | Lambda (MCP server + OSCAL loader), API Gateway HTTP API |

## Prerequisites

- AWS CLI configured with appropriate permissions
- `aws cloudformation`, `aws lambda` commands available

## Deploy (fresh environment)

```bash
ENV=dev
DB_PASSWORD=your-secure-password-here

# 1. VPC (no dependencies)
aws cloudformation deploy \
  --stack-name grc-${ENV}-vpc \
  --template-file deploy/aws/vpc.yaml \
  --parameter-overrides Environment=${ENV} \
  --region us-west-2

# 2. Data (depends on VPC exports)
aws cloudformation deploy \
  --stack-name grc-${ENV}-data \
  --template-file deploy/aws/data.yaml \
  --parameter-overrides Environment=${ENV} DBPassword=${DB_PASSWORD} \
  --region us-west-2

# 3. Compute (depends on VPC + data exports)
API_KEY=$(python3 -c "import secrets; print(secrets.token_urlsafe(32))")
aws cloudformation deploy \
  --stack-name grc-${ENV}-compute \
  --template-file deploy/aws/compute.yaml \
  --parameter-overrides Environment=${ENV} ApiKey=${API_KEY} \
  --capabilities CAPABILITY_NAMED_IAM \
  --region us-west-2
echo "Save your API key: ${API_KEY}"

# 4. Deploy Lambda code (CloudFormation only creates the function infrastructure)
./scripts/deploy_lambda.sh ${ENV}
./scripts/deploy_oscal_loader.sh ${ENV}

# 5. Seed the database
./scripts/seed_rds.sh ${ENV}
```

## Update Lambda code only

When MCP server code changes (no infrastructure changes needed):

```bash
./scripts/deploy_lambda.sh dev
./scripts/deploy_oscal_loader.sh dev
```

## OSCAL Loader Lambda

The OSCAL loader reads seed SQL files from S3 and applies them to RDS. It supports two actions:

```bash
# Full reseed — drops all tables, applies schema, loads all seed files
aws lambda invoke --function-name grc-dev-oscal-loader \
  --payload '{"action": "reseed"}' --cli-binary-format raw-in-base64-out \
  --region us-west-2 /dev/stdout

# Status — check current catalog version in RDS
aws lambda invoke --function-name grc-dev-oscal-loader \
  --payload '{"action": "status"}' --cli-binary-format raw-in-base64-out \
  --region us-west-2 /dev/stdout
```

Seed files must be uploaded to S3 first:

```bash
aws s3 cp core/db/schema.sql s3://grc-dev-oscal-data-995433633495/seed/schema.sql
aws s3 sync core/db/seed/ s3://grc-dev-oscal-data-995433633495/seed/ --exclude "*" --include "*.sql"
```

### Automated updates via GitHub Actions

The `apply-nist-update.yml` workflow automatically uploads seed files to S3 and invokes the OSCAL loader when NIST seed files change on `main`. This is triggered after merging a PR from the weekly `sync-nist.yml` workflow.

**Required GitHub secrets** (set in repo Settings > Secrets):

- `AWS_ACCESS_KEY_ID` — IAM user with `s3:PutObject` on the OSCAL bucket and `lambda:InvokeFunction` on the loader
- `AWS_SECRET_ACCESS_KEY` — corresponding secret key

## Architecture notes

- **No internet gateway** — all traffic stays within the VPC via VPC endpoints (Secrets Manager interface endpoint, S3 gateway endpoint)
- **RDS** — private subnets only, not publicly accessible. Add a temporary security group rule if direct DB access is needed (e.g., for seeding)
- **Lambda code** — CloudFormation templates contain a placeholder `ZipFile`. Actual code is deployed via `scripts/deploy_lambda.sh`. This keeps the templates stable; code updates don't require stack updates
- **DB credentials** — stored in Secrets Manager at `grc/{env}/db-credentials`. Lambda reads them at runtime via the VPC endpoint
- **API key authentication** — the MCP endpoint requires an `x-api-key` header. The key is passed to Lambda via the `API_KEY` environment variable (set during CloudFormation deploy). If `API_KEY` is empty, auth is disabled

## Claude Desktop configuration

Add the API key to your Claude Desktop MCP server config (`~/Library/Application Support/Claude/claude_desktop_config.json`):

```json
{
  "mcpServers": {
    "grc-platform": {
      "command": "npx",
      "args": [
        "-y", "mcp-remote",
        "https://YOUR-API-ID.execute-api.us-west-2.amazonaws.com/mcp",
        "--header", "x-api-key:YOUR_API_KEY"
      ]
    }
  }
}
```

## Current dev environment

| Resource     | Value                                                         |
|--------------|---------------------------------------------------------------|
| Region       | us-west-2                                                     |
| API endpoint | `https://0tdx0fif8b.execute-api.us-west-2.amazonaws.com/mcp`  |
| RDS endpoint | `grc-dev-db.cbtyvi6qukg0.us-west-2.rds.amazonaws.com`         |
| Lambda       | `grc-dev-mcp-server`                                          |
