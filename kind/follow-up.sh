kubectl label node k1-control-plane node.kubernetes.io/exclude-from-external-load-balancers-

# https://github.com/kubernetes-sigs/cloud-provider-kind
cloud-provider-kind -enable-lb-port-mapping