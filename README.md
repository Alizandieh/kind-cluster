# Kubernetes cluster - Kind

This is a Kind k8s cluster which using FluxCD for deploying the components and core-services

## Create Kind cluster 
I create a Kind cluster with some port mapping and disbale the default CNI
In prerequisite/kind folder run ./create.sh

To create a local Loadbalancer run the ./loadbalancer.sh

## Install Calico 
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