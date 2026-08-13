# Jenkins

Deploys Jenkins into the `aws-cloud-lab` namespace via the official `jenkinsci/jenkins` Helm chart.

## Install

```bash
kubectl apply -f ../namespace.yaml
helm repo add jenkinsci https://charts.jenkins.io
helm repo update
helm install jenkins jenkinsci/jenkins -n aws-cloud-lab -f jenkins.values.yaml
```

## Access

```bash
kubectl -n aws-cloud-lab port-forward svc/jenkins 8081:8080
```

Then browse to `http://localhost:8081`. Retrieve the initial admin password:

```bash
kubectl -n aws-cloud-lab exec -it svc/jenkins -c jenkins -- \
  cat /run/secrets/additional/chart-admin-password
```
