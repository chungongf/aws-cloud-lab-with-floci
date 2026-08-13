# aws-cloud-lab-with-floci
A zero-cost local AWS cloud lab using Floci, Docker, Kubernetes, Terraform, Jenkins, and DevSecOps automation.

#  AWS Cloud Lab with Floci

A zero-cost local AWS cloud engineering lab designed to simulate real-world AWS infrastructure, Kubernetes, DevOps, DevSecOps, Infrastructure as Code, and cloud security workflows without requiring a production AWS account.

The project uses **Floci**, Docker, Kubernetes/K3s, Terraform, Jenkins, and security tooling to create a realistic local cloud environment.

---

##  Project Goal

The goal of this project is to create a practical AWS engineering environment that can run locally on a developer workstation.

The lab is designed to allow engineers to practice:

- AWS architecture
- Infrastructure as Code
- Terraform
- Kubernetes
- EKS
- Jenkins
- CI/CD
- DevSecOps
- IAM
- Networking
- Security
- Containerization
- Cloud automation
- Disaster recovery concepts
- Cloud security testing

without continuously creating billable AWS resources.

---

#  High-Level Architecture

```text
                         Mac / Developer PC
                                │
                                ▼
                         ┌──────────────┐
                         │    Docker    │
                         └──────┬───────┘
                                │
                                ▼
                         ┌──────────────┐
                         │    Floci     │
                         │              │
                         │ AWS API      │
                         │ Port 4566    │
                         └──────┬───────┘
                                │
          ┌─────────────────────┼─────────────────────┐
          │                     │                     │
          ▼                     ▼                     ▼
        AWS Services        Kubernetes             EC2
          │                     │                     │
          │                     ▼                     ▼
          │                    K3s              Docker Containers
          │                     │
          │                     ▼
          │                  Jenkins
          │                     │
          │                     ▼
          │                  CI/CD
          │
          ├── S3
          ├── IAM
          ├── ECR
          ├── Lambda
          ├── RDS
          ├── KMS
          ├── Secrets Manager
          ├── EC2
          ├── EKS
          ├── CloudWatch
          └── Other AWS Services
