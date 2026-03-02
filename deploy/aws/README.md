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
aws cloudformation deploy \
  --stack-name grc-${ENV}-compute \
  --template-file deploy/aws/compute.yaml \
  --parameter-overrides Environment=${ENV} \
  --capabilities CAPABILITY_NAMED_IAM \
  --region us-west-2

# 4. Deploy Lambda code (CloudFormation only creates the function infrastructure)
./scripts/deploy_lambda.sh ${ENV}

# 5. Seed the database
./scripts/seed_rds.sh ${ENV}
```

## Update Lambda code only

When MCP server code changes (no infrastructure changes needed):

```bash
./scripts/deploy_lambda.sh dev
```

## Architecture notes

- **No internet gateway** — all traffic stays within the VPC via VPC endpoints (Secrets Manager interface endpoint, S3 gateway endpoint)
- **RDS** — private subnets only, not publicly accessible. Add a temporary security group rule if direct DB access is needed (e.g., for seeding)
- **Lambda code** — CloudFormation templates contain a placeholder `ZipFile`. Actual code is deployed via `scripts/deploy_lambda.sh`. This keeps the templates stable; code updates don't require stack updates
- **DB credentials** — stored in Secrets Manager at `grc/{env}/db-credentials`. Lambda reads them at runtime via the VPC endpoint

## Current dev environment

| Resource     | Value                                                         |
|--------------|---------------------------------------------------------------|
| Region       | us-west-2                                                     |
| API endpoint | `https://0tdx0fif8b.execute-api.us-west-2.amazonaws.com/mcp`  |
| RDS endpoint | `grc-dev-db.cbtyvi6qukg0.us-west-2.rds.amazonaws.com`         |
| Lambda       | `grc-dev-mcp-server`                                          |
