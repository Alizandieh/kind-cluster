# Kubernetes cluster - Kind

This is a Local Kind k8s cluster setup written by Ali Zandieh for POCs and tests. 
I'm using FluxCD for deploying the apps and core-services.

## Requirements
- Docker - I'm using Docker Desktop in Windows and WSL(ubuntu)
- Kubectl
- Helm
- Kind  - [Install Kind](https://kind.sigs.k8s.io/docs/user/quick-start/#installation) 
- Kind Cloud Provider - [Installation guide](https://github.com/kubernetes-sigs/cloud-provider-kind?tab=readme-ov-file#install)
- Flux CLI - [Install docs](https://fluxcd.io/flux/cmd/)

## Create Kind cluster 
I create a Kind cluster with some port mapping and disbale the default CNI
In prerequisite/kind folder run ./create.sh

To create a local Loadbalancer run the ./loadbalancer.sh

## Install Calico CNI
In prerequisite/calico folder run ./install-in-kind.sh

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

## Atlantis 

Before enabling Atlatis you need to create the secret below for Github PAT and Webhook secret:
```
echo -n "your PAT token" > github_token
echo -n "your webhook secret" > github_secret
kubectl -n atlantis create secret generic atlantis-vcs --from-file=github_token --from-file=github_secret
```

If you want to add AWS creds as a k8s secret:
create "credentials" file with the details inside then 
```
kubectl -n atlantis create secret generic aws-vcs --from-file=credentials
```

## To Delete the cluster 

```
kinkind delete cluster --name k1
```