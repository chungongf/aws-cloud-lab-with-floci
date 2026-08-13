# Troubleshooting

## Terraform

- **`Error: No valid credential sources found`** — run `aws configure` or export `AWS_PROFILE`.
- **State lock errors** — confirm no other `terraform apply` is running; check your configured backend for stale locks.

## floci / Docker Compose

- **Containers won't start** — run `./floci/scripts/status.sh` and check `docker-compose logs`.
- **Port conflicts** — check `floci/docker-compose.yml` and `floci/config/` for port bindings that collide with other local services.

## Kubernetes

- **`kubectl` can't reach the cluster** — verify `~/.kube/config` points at the right context (`kubectl config current-context`).
- **Pods stuck in `Pending`** — check node capacity and that the namespace from `kubernetes/namespace.yaml` was applied.

## DevSecOps Pipeline

- **Checkov failures blocking CI** — review findings under `devsecops/security/checkov/`; suppress only with a documented justification.
- **Trivy failures blocking CI** — rebuild the image after patching the flagged dependency; avoid blanket ignores.
