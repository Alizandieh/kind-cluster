# Kubernetes cluster - Kind

This is a Local Kind k8s cluster setup written by **Ali Zandieh** for POCs and tests. 

I'm using FluxCD for deploying the apps and core-services.

## Requirements
- Docker - I'm using Docker Desktop in Windows and WSL(ubuntu)
- Kubectl
- Helm
- Kind  - [Install Kind](https://kind.sigs.k8s.io/docs/user/quick-start/#installation)
- Kind Cloud Provider - [Installation guide](https://github.com/kubernetes-sigs/cloud-provider-kind?tab=readme-ov-file#install)
- Flux CLI - [Install docs](https://fluxcd.io/flux/cmd/)

## Create Kind cluster 
It creates a Kind cluster with 
- 1 control-plane and 2 worker nodes. 
- Some port mappings (80, 443) to the host 
- Disbales the default CNI (because I want to replace it with Calico)
```
cd prerequisite/kind 
./create.sh

# To create a local Loadbalancer
./loadbalancer.sh
```
## Install Calico CNI
```
cd prerequisite/calico
./install-in-kind.sh
```

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

Before enabling Atlatis you need to create the secret below for Github PAT and Webhook secret.

[Atlantis docs](https://www.runatlantis.io/docs/installation-guide.html)
```
echo -n "your PAT token" > github_token
echo -n "your webhook secret" > github_secret
kubectl -n atlantis create secret generic atlantis-vcs --from-file=github_token --from-file=github_secret
```

If you want to add AWS creds as a k8s secret:
create "credentials" file with the details inside it then
```
kubectl -n atlantis create secret generic aws-vcs --from-file=credentials
```

## To Delete the cluster 

```
kind delete cluster --name k1
```