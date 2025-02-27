# PREREQUISITES:
- Reference folder: docker/
- Installation:
```shell
bash install-docker-kind-kubectl.sh
bash install-monitoring.sh
```

# HOW TO RUN THE OPEN-EMR APP:
```shell
# Create a Kubernetes Cluster
kind create cluster --config cluster1-config.yaml

# Deploy the app
cd production/manifests/
kubectl apply -f mysql-deployment.yaml
kubectl apply -f openemr-deployment.yaml

# Verify setup
http://localhost:30002 # or http://127.0.0.1:30002, or http://<ExternalPort>:30002
  # Login with: admin/pass
kubectl get nodes,all
kubectl get nodes,all -o wide
```

# HOW TO MONITOR THE APP:
```shell
helm install prometheus prometheus-community/kube-prometheus-stack \
  --namespace monitoring \
  --create-namespace \
  -f prometheus-values.yaml

  (helm upgrade prometheus prometheus-community/kube-prometheus-stack \
    --namespace monitoring \
    -f /root/k8s_for_openemr/kube/production/manifests/prometheus-values.yaml)

kubectl apply -f mysql-deployment.yaml
kubectl apply -f monitoring-config.yaml

http://localhost:30001 # or http://127.0.0.1:30001, or http://<ExternalPort>:30001
  # Login with: admin/admin
  # Import MariaDB Dashboard:
  #   Click + -> Import
  #   Enter dashboard ID: 7362 (MariaDB Overview)
  #   Select Prometheus as data source
```

# HOW TO CLEAN UP
```shell
kubectl delete -f openemr-deployment.yaml
kubectl delete -f mysql-deployment.yaml
kubectl delete -f monitoring-config.yaml
kind delete cluster --name cluster1 # Warning: should not use
```