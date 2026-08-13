# Getting Started

## 1. Prerequisites

- AWS CLI configured (`aws configure`) with credentials that have permission to create VPC, S3, IAM, EC2, and ECR resources.
- Terraform >= 1.5
- Docker + Docker Compose
- kubectl

## 2. Bootstrap the local environment

```bash
./scripts/aws-local-env.sh
```

## 3. Provision infrastructure

```bash
cd terraform
terraform init
terraform plan
terraform apply
```

## 4. Start floci

```bash
cd floci
docker-compose up -d
./scripts/status.sh
```

## 5. Deploy Kubernetes workloads

```bash
kubectl apply -f kubernetes/namespace.yaml
kubectl apply -f kubernetes/applications/
```

## 6. Verify

```bash
./scripts/verify.sh
```

## 7. Tear down

```bash
./scripts/cleanup.sh
cd terraform && terraform destroy
```
