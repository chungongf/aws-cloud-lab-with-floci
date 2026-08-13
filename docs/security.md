# Security

## Scanning

- **Checkov** — static analysis of Terraform for misconfigurations. Config lives in [devsecops/security/checkov/](../devsecops/security/checkov/).
- **Trivy** — container image and filesystem vulnerability scanning. Config lives in [devsecops/security/trivy/](../devsecops/security/trivy/).

Both run as part of the pipeline defined in [devsecops/.gitlab-ci.yml](../devsecops/.gitlab-ci.yml).

## Secrets

- Never commit AWS credentials, `.tfvars` files with real values, or `.env` files — see [.gitignore](../.gitignore).
- Use `aws-vault`, environment variables, or your CI's secret store for credentials.

## IAM

- Follow least-privilege for any role/policy defined under `terraform/modules/iam/`.
- Review IAM diffs carefully in `terraform plan` output before applying.

## Reporting

_Document how to report a security issue found in this lab here._
