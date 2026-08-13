# Architecture

## Overview

This lab provisions AWS infrastructure via Terraform, deploys workloads to Kubernetes, and runs a DevSecOps pipeline for security scanning — all orchestrated locally through floci.

## Components

- **floci** — local orchestration layer (docker-compose) that runs the lab's supporting services.
- **terraform/** — provisions VPC, S3, IAM, EC2, and ECR resources via composable modules.
- **kubernetes/** — cluster manifests and Helm values (Jenkins, application workloads).
- **devsecops/** — GitLab CI pipeline running Checkov (IaC scanning) and Trivy (image/vuln scanning).

## Data / Control Flow

```
Terraform  -->  AWS resources (VPC, IAM, S3, EC2, ECR)
Kubernetes -->  Workloads deployed onto provisioned infra
DevSecOps  -->  Scans Terraform + container images before/after apply
floci      -->  Local dev/test harness tying the above together
```

## Design Decisions

_Document key architectural decisions and trade-offs here as the lab evolves._
