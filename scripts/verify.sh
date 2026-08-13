#!/usr/bin/env bash
set -euo pipefail

echo "Verifying Terraform state..."
(cd terraform && terraform validate)

echo "Verifying floci is running..."
(cd floci && docker-compose ps)

echo "Verifying Kubernetes namespace..."
kubectl get namespace aws-cloud-lab

echo "All checks passed."
