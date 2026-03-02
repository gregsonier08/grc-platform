#!/usr/bin/env bash
# Build and deploy the OSCAL Loader Lambda package.
# Usage: ./scripts/deploy_oscal_loader.sh [environment]
# Default environment: dev

set -euo pipefail

ENV=${1:-dev}
FUNCTION_NAME="grc-${ENV}-oscal-loader"
REGION="us-west-2"
BUILD_DIR="/tmp/oscal-loader-build-$$"
ZIP_FILE="/tmp/oscal-loader-package-$$.zip"

echo "Building Lambda package for ${FUNCTION_NAME}..."

# Build
rm -rf "$BUILD_DIR"
mkdir "$BUILD_DIR"
pip install pg8000 --target "$BUILD_DIR" -q
cp core/oscal-loader/handler.py "$BUILD_DIR/handler.py"
cp core/oscal-loader/db.py "$BUILD_DIR/db.py"

# Package
cd "$BUILD_DIR"
zip -r "$ZIP_FILE" . -x "*.pyc" -x "*/__pycache__/*" -q
cd - > /dev/null

SIZE=$(du -sh "$ZIP_FILE" | cut -f1)
echo "Package size: ${SIZE}"

# Deploy
echo "Uploading to ${FUNCTION_NAME}..."
aws lambda update-function-code \
  --function-name "$FUNCTION_NAME" \
  --zip-file "fileb://${ZIP_FILE}" \
  --region "$REGION" \
  --query 'FunctionArn' --output text

aws lambda wait function-updated \
  --function-name "$FUNCTION_NAME" \
  --region "$REGION"

# Cleanup
rm -rf "$BUILD_DIR" "$ZIP_FILE"

echo "Done. Deployed to ${FUNCTION_NAME}."
