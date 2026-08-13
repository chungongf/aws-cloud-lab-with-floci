#!/usr/bin/env bash
set -euo pipefail

echo "Stopping floci..."
(cd floci && docker-compose down -v) || true

echo "Deleting Kubernetes applications..."
kubectl delete -f kubernetes/applications/ --ignore-not-found || true
kubectl delete namespace aws-cloud-lab --ignore-not-found || true

echo "Cleanup complete. Run 'terraform destroy' in terraform/ separately to remove AWS resources."
