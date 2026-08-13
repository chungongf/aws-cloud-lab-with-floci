#!/usr/bin/env bash
set -euo pipefail

echo "Checking prerequisites..."
for cmd in aws terraform docker kubectl; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "Missing required tool: $cmd" >&2
    exit 1
  fi
done

echo "Verifying AWS credentials..."
aws sts get-caller-identity

echo "Local environment ready."
