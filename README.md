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


AWS Services

The lab can be expanded to include services such as:

Compute
EC2
Lambda
ECS
EKS
Storage
S3
EBS
Database
RDS
DynamoDB
Security
IAM
KMS
Secrets Manager
Cognito
Networking
VPC
Route 53
API Gateway
Load Balancers
Containers
ECR
ECS
EKS
Messaging
SQS
SNS
EventBridge
MSK
Monitoring
CloudWatch

The Floci documentation currently describes support for dozens of AWS services, including S3, Step Functions, Neptune, Transcribe, ElastiCache, RDS, API Gateway, CloudFront, AppSync and Route 53.

🧰 Technology Stack
Technology	Purpose
Floci	Local AWS environment
Docker	Container runtime
Kubernetes	Container orchestration
K3s	Lightweight Kubernetes
Terraform	Infrastructure as Code
Helm	Kubernetes package management
Jenkins	CI/CD
GitHub	Source control
Checkov	IaC security
Trivy	Container/filesystem security
Bash	Automation
Python	Cloud automation
AWS CLI	AWS API interaction
🖥️ Local Environment

Recommended development environment:

macOS / Linux / Windows
        │
        ├── Docker
        │
        ├── AWS CLI
        │
        ├── kubectl
        │
        ├── Helm
        │
        ├── Terraform
        │
        └── Floci
🔐 AWS Local Credentials

For local development, AWS CLI commands should be configured so they do not accidentally target a real AWS account.

Example:

export AWS_ACCESS_KEY_ID=test
export AWS_SECRET_ACCESS_KEY=test
export AWS_DEFAULT_REGION=us-east-1
export AWS_ENDPOINT_URL=http://localhost:4566

Verify the local environment:

aws sts get-caller-identity \
  --endpoint-url http://localhost:4566

Never place real AWS access keys or secrets in this repository.

🚀 Starting Floci

Start the local cloud environment:

docker start floci

Verify:

docker ps

You should see the Floci container running.

The standard local AWS API endpoint is:

http://localhost:4566
🔍 Verify AWS Connectivity

Run:

aws sts get-caller-identity \
  --endpoint-url http://localhost:4566

Then:

aws s3 ls \
  --endpoint-url http://localhost:4566
🖥️ EC2 Lab

The EC2 implementation provides a way to create local compute instances represented by Docker containers.

The lab can demonstrate:

Terraform
   │
   ▼
EC2 API
   │
   ▼
Floci
   │
   ▼
Docker Container
   │
   ▼
Linux Instance

Example workflow:

aws ec2 run-instances \
  --image-id ami-local \
  --instance-type t3.micro \
  --endpoint-url http://localhost:4566

The exact AMI and parameters depend on the local environment configuration.

🔑 SSH Access

Local EC2 instances can be accessed through the mapped SSH port.

Example:

ssh -i ~/.ssh/floci_key \
    -p 2200 \
    ec2-user@localhost

This allows the developer to interact with the local EC2 environment similarly to a traditional cloud instance.

☸️ Kubernetes / EKS Lab

The project also provides a local Kubernetes environment using K3s.

Architecture:

Floci
  │
  ▼
EKS-compatible API
  │
  ▼
K3s
  │
  ├── Jenkins
  ├── Applications
  ├── Monitoring
  └── Security tooling

Verify the cluster:

kubectl get nodes

Example:

NAME          STATUS   ROLES
bf18e88f4004  Ready    control-plane
🔧 Jenkins

Jenkins is deployed into Kubernetes using Helm.

Example:

helm repo add jenkins https://charts.jenkins.io

helm repo update

Create the namespace:

kubectl create namespace ci

Install Jenkins:

helm install jenkins jenkins/jenkins \
  --namespace ci \
  --values kubernetes/jenkins/jenkins.values.yaml

Verify:

kubectl get pods -n ci

Check the service:

kubectl get svc jenkins -n ci
🌐 Access Jenkins

For local development, port forwarding is the simplest option:

kubectl port-forward \
  -n ci \
  svc/jenkins \
  8080:8080

Then open:

http://localhost:8080
🏗️ Terraform

Terraform is used to create repeatable infrastructure.

Example architecture:

Terraform
    │
    ▼
AWS Provider
    │
    ▼
Floci Endpoint
    │
    ├── VPC
    ├── S3
    ├── IAM
    ├── EC2
    ├── ECR
    └── Other Services

Initialize:

terraform init

Validate:

terraform validate

Plan:

terraform plan

Apply:

terraform apply

Destroy:

terraform destroy
🔐 DevSecOps Pipeline

The project is designed around:

Developer
    │
    ▼
GitHub
    │
    ▼
CI/CD
    │
    ├── Terraform Validate
    │
    ├── Checkov
    │
    ├── Trivy
    │
    ├── Secret Scanning
    │
    ├── Container Scanning
    │
    └── Security Tests
    │
    ▼
Terraform Plan
    │
    ▼
Human Approval
    │
    ▼
Terraform Apply
    │
    ▼
Local AWS Environment
🛡️ Security Controls

The project incorporates cloud security best practices including:

IAM
Least privilege
Role-based access
Separation of duties
No hard-coded credentials
Encryption
KMS
Encryption at rest
TLS/HTTPS
Secrets management
Network Security
Private networking
Security groups
Network segmentation
Controlled ingress/egress
Infrastructure Security
Terraform scanning
Configuration validation
Container scanning
Secret detection
🔎 Checkov

Checkov is used to scan Terraform infrastructure.

Install:

pip install checkov

Run:

checkov -d terraform/

Example workflow:

Terraform
    │
    ▼
Checkov
    │
    ├── PASS
    ├── WARN
    └── FAIL
🐳 Trivy

Trivy is used to scan:

Container images
Filesystems
Kubernetes configurations
Infrastructure artifacts

Example:

trivy fs .

Container example:

trivy image my-application:latest
🔄 CI/CD with Jenkins

The Jenkins pipeline will eventually implement:

Checkout
   │
   ▼
Terraform Validate
   │
   ▼
Security Scan
   │
   ▼
Terraform Plan
   │
   ▼
Approval
   │
   ▼
Terraform Apply
   │
   ▼
Application Deployment
   │
   ▼
Security Validation
🧪 Example Projects

This repository will contain progressively more advanced examples.

Example 1 — S3

Create an S3 bucket locally.

Terraform
   ↓
S3
   ↓
Floci
Example 2 — EC2

Launch a local EC2 instance represented by a Docker container.

Example 3 — IAM

Create roles and policies and test least-privilege access.

Example 4 — ECR

Create an ECR repository and push a local container image.

Example 5 — Lambda

Deploy and invoke a Lambda function locally.

Example 6 — EKS

Create a Kubernetes environment and deploy applications.

Example 7 — Jenkins

Deploy Jenkins into Kubernetes and build CI/CD pipelines.

🧩 Multi-Account Architecture

Floci supports account isolation, allowing multiple environments to be represented locally.

Example:

Local Floci
     │
     ├── Development Account
     │
     ├── Security Account
     │
     ├── Logging Account
     │
     └── Production Simulation

This can be used to practice AWS Organizations-style architectures and account separation without creating multiple real AWS accounts.

🏢 Enterprise Architecture Simulation

The long-term goal is to simulate a real federal/enterprise cloud environment:

                   Organization
                        │
        ┌───────────────┼───────────────┐
        │               │               │
        ▼               ▼               ▼
    Security         Logging         Workload
     Account         Account          Account
        │               │               │
        │               │               │
        └───────────────┼───────────────┘
                        │
                     Network
                        │
                        ▼
                      EKS
                        │
              ┌─────────┼─────────┐
              │         │         │
           Jenkins   Apps      Monitoring
🎯 DevSecOps Objectives

The lab will demonstrate:

Infrastructure as Code
Secure CI/CD
Automated security testing
Kubernetes security
AWS IAM
Container security
Vulnerability management
Secrets management
Network security
Compliance automation
Cloud architecture
📊 Observability

Future implementations will include:

Prometheus
Grafana
CloudWatch-compatible monitoring
Application metrics
Container metrics
Infrastructure metrics
Security events

Architecture:

Applications
     │
     ▼
Kubernetes
     │
     ▼
Prometheus
     │
     ▼
Grafana
🔐 Compliance Lab

The environment can be used to experiment with security controls aligned to:

NIST 800-53
NIST 800-171
FedRAMP concepts
CIS Benchmarks
Zero Trust principles

Example:

Security Requirement
        │
        ▼
Terraform Implementation
        │
        ▼
Checkov Validation
        │
        ▼
Evidence
        │
        ▼
Compliance Report
🧠 Future AI Integration

A future version of this project will integrate AI into the DevSecOps workflow.

Terraform
   │
   ▼
Security Scanner
   │
   ▼
AI Security Agent
   │
   ├── Explain Finding
   ├── Determine Risk
   ├── Map Compliance
   ├── Recommend Fix
   └── Generate Remediation
             │
             ▼
       Human Approval
             │
             ▼
       Terraform Apply

This will allow the project to evolve into an:

AI-powered Cloud Security and DevSecOps Platform

🚧 Roadmap
Phase 1 — Local AWS
 Install Docker
 Install Floci
 Configure AWS CLI
 Verify local AWS endpoint
 Create S3 resources
 Create IAM resources
 Create EC2 instances
Phase 2 — Infrastructure as Code
 Terraform provider
 Terraform modules
 VPC
 IAM
 S3
 EC2
 ECR
 Lambda
Phase 3 — Kubernetes
 K3s
 kubectl
 Helm
 Jenkins
 Ingress
 Monitoring
 Container security
Phase 4 — DevSecOps
 Jenkins pipelines
 GitHub Actions
 Checkov
 Trivy
 Secret scanning
 SAST
 SCA
 Security gates
Phase 5 — Cloud Security
 IAM security testing
 KMS
 Secrets Manager
 Security policies
 Network security
 Compliance validation
Phase 6 — AI DevSecOps
 LLM integration
 Security finding analysis
 AI risk classification
 Compliance mapping
 AI remediation recommendations
 Human approval workflow
 Agentic AI
 MCP integration
🧪 Learning Objectives

By completing this project, an engineer should gain hands-on experience with:

Cloud Architecture

AWS service design, networking, identity, compute, storage, databases and containers.

Infrastructure as Code

Terraform-based infrastructure provisioning and reusable modules.

Kubernetes

K3s, EKS concepts, Helm, services, deployments and ingress.

DevSecOps

Secure CI/CD pipelines and automated security controls.

Cloud Security

IAM, encryption, secrets, network security and vulnerability management.

AI

AI-assisted infrastructure analysis and automated security remediation.

💵 Cost Model

The primary development environment is local.

Cloud Provider Billing

AWS Account
    │
    └── $0 required for core local lab

Local Infrastructure

Docker
   +
Floci
   +
Kubernetes
   +
Terraform
   +
Jenkins

This makes the project suitable for repeated testing and experimentation without relying on billable cloud resources.

⚠️ Security Warning

Never place real AWS credentials in this repository.

Do not commit:

.aws/
credentials
access keys
secret keys
private keys
.pem files
.env files
Terraform state containing secrets
Kubernetes secrets

Use dummy/local credentials when working with Floci.

📁 Repository Structure
aws-cloud-lab-with-floci/
│
├── README.md
├── LICENSE
├── .gitignore
│
├── docs/
│
├── floci/
│
├── terraform/
│
├── kubernetes/
│
├── devsecops/
│
├── examples/
│
└── scripts/
👨‍💻 Author

Albert Funwi

Cloud Architecture | AWS | DevSecOps | Cloud Security | Infrastructure | Kubernetes

⭐ Project Vision

The ultimate goal is to create a realistic local cloud engineering platform that allows engineers to practice enterprise AWS architecture, DevSecOps, Kubernetes, cloud security and AI-assisted infrastructure automation without depending on expensive cloud environments.

Learn
  ↓
Build
  ↓
Secure
  ↓
Automate
  ↓
Test
  ↓
Monitor
  ↓
Optimize
  ↓
Deploy
⭐ If you find this project useful

Consider starring the repository and using it as a foundation for your own local cloud engineering lab.


---

# 3. `.gitignore`

Create `.gitignore`:

```gitignore
# macOS
.DS_Store

# Environment files
.env
.env.*
!.env.example

# AWS
.aws/
credentials
config

# Secrets
*.pem
*.key
*.crt
*.p12
*.pfx

# SSH
id_rsa
id_ed25519
known_hosts

# Terraform
.terraform/
*.tfstate
*.tfstate.*
*.tfplan
crash.log
crash.*.log
*.tfvars
*.tfvars.json

# Kubernetes
kubeconfig
*.secret.yaml

# Python
__pycache__/
*.py[cod]
.venv/
venv/

# Node
node_modules/

# Logs
*.log

# Reports
reports/
security/reports/

# IDE
.vscode/
.idea/

# Docker
docker-compose.override.yml
4. Create your Floci environment script

I'd also put this in:

scripts/aws-local-env.sh
#!/bin/bash

# ==========================================
# Local AWS Environment - Floci
# ==========================================

export AWS_ACCESS_KEY_ID=test
export AWS_SECRET_ACCESS_KEY=test
export AWS_DEFAULT_REGION=us-east-1
export AWS_ENDPOINT_URL=http://localhost:4566

echo "=========================================="
echo " Local AWS Environment"
echo "=========================================="

echo "AWS Region: $AWS_DEFAULT_REGION"
echo "AWS Endpoint: $AWS_ENDPOINT_URL"
echo "Access Key: $AWS_ACCESS_KEY_ID"

echo ""
echo "Testing Floci..."

aws sts get-caller-identity \
  --endpoint-url "$AWS_ENDPOINT_URL"

echo ""
echo "Floci environment configured successfully."

Then:

chmod +x scripts/aws-local-env.sh

Run:

source scripts/aws-local-env.sh
5. Create a verification script

Create:

scripts/verify.sh
#!/bin/bash

set -e

echo "=========================================="
echo " AWS Local Cloud Lab Verification"
echo "=========================================="

echo ""
echo "[1] Checking Docker"
docker ps

echo ""
echo "[2] Checking Floci"
curl -s http://localhost:4566/ > /dev/null

echo "Floci API is reachable."

echo ""
echo "[3] Checking AWS Identity"

aws sts get-caller-identity \
  --endpoint-url http://localhost:4566

echo ""
echo "[4] Checking S3"

aws s3 ls \
  --endpoint-url http://localhost:4566

echo ""
echo "[5] Checking Kubernetes"

kubectl get nodes

echo ""
echo "=========================================="
echo " Local Cloud Lab Verification Complete"
echo "=========================================="
6. Your first GitHub commit

After creating the files:

mkdir aws-cloud-lab-with-floci
cd aws-cloud-lab-with-floci

Then:

git init
git add .
git commit -m "Initial AWS local cloud lab with Floci"

Then create the GitHub repository:

aws-cloud-lab-with-floci

Then:

git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/aws-cloud-lab-with-floci.git

And:

git push -u origin main
What I'd do next with this project

Since you've already successfully gotten Floci running, created the local EKS/K3s cluster, and deployed Jenkins, I wouldn't make this repository theoretical.

I'd make the GitHub repo show your actual working lab:

                    AWS CLOUD LAB
                          │
                        FLOCI
                          │
             ┌────────────┼────────────┐
             │            │            │
            EC2          EKS          S3
             │            │
             │         Kubernetes
             │            │
             │         Jenkins
             │            │
             │         CI/CD
             │            │
             └────────────┼────────────┘
                          │
                       Terraform
                          │
                    DevSecOps Scans
                          │
                 ┌────────┴────────┐
                 │                 │
               Checkov           Trivy
                 │                 │
                 └────────┬────────┘
                          │
                       AI Agent

