# Kubernetes cluster - Kind

This is a Kind k8s cluster which using FluxCD for deploying the components and core-services

## Flux Bootstraping

bootstrap command:

```
export GITHUB_TOKEN=<gh-token>

flux bootstrap github --token-auth \
  --owner=alizandieh \
  --repository=kind-cluster \
  --branch=main \
  --personal

```