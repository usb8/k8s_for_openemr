# PREREQUISITES:
- Installation: `bash install_docker_kind_kubectl.sh`
- Reference folder: docker/

# HOW TO USE:
```shell
# Create a Kubernetes Cluster
cd k8s_for_openemr/kube/
kind create cluster --config cluster1-config.yaml

# Deploy the app
cd production/manifests/
kubectl apply -f mysql-deployment.yaml
kubectl apply -f openemr-deployment.yaml # Open: localhost:30002 or 127.0.0.1:30002

# Clean up if needed
kubectl delete -f openemr-deployment.yaml
kubectl delete -f mysql-deployment.yaml
kind delete cluster --name cluster1
```
- Link demo: http://209.38.207.159:30002