#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

echo "Running Checkov..."
checkov -d ../terraform --config-file security/checkov/config.yaml

echo "Running Trivy filesystem scan..."
trivy fs --config security/trivy/trivy.yaml ..
