#!/bin/sh
# Simple local deployment: copy the application to a target directory.
set -e

DEPLOY_DIR="${DEPLOY_DIR:-$HOME/deployed_app}"

echo "Deploying application to ${DEPLOY_DIR}..."
mkdir -p "${DEPLOY_DIR}"
cp app.py "${DEPLOY_DIR}/"

echo "Verifying deployment..."
python3 "${DEPLOY_DIR}/app.py"

echo "Deployment successful."
