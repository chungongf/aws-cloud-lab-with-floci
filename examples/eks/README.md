# EKS Example

Minimal, standalone example for provisioning an EKS cluster and connecting `kubectl`.

```bash
terraform init
terraform apply
aws eks update-kubeconfig --name <cluster-name> --region <region>
```
