# Kubernetes cluster - Kind

This is a Kind k8s cluster which using FluxCD for deploying the components and core-services

## Flux Bootstraping

bootstrap command:

```
export GITLAB_TOKEN=<your-token>

flux bootstrap gitlab --token-auth \
--owner=Consensys/codefi/infrastructure/kubernetes \
--components-extra=image-reflector-controller,image-automation-controller \
--repository=tenant-cluster-configs-sample \
--branch=master

```