helm repo add projectcalico https://docs.tigera.io/calico/charts
helm update
helm install calico projectcalico/tigera-operator --namespace tigera-operator --create-namespace