#!/bin/bash

# Stop script on any error
set -e

# Install Helm
echo "Installing Helm..."
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Add Helm repositories # ~npm1 (add source) inside Cluster
echo "Adding Helm repositories..."
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
# helm repo add grafana https://grafana.github.io/helm-charts
helm repo update

# # Install Prometheus Stack # ~npm2 (install) install resources (like Deployments, Services, Pods, v.v) inside Cluster --> modules like node_modules
# echo "Installing Prometheus..."
# helm install prometheus prometheus-community/kube-prometheus-stack
#   helm uninstall prometheus
#   helm upgrade prometheus prometheus-community/kube-prometheus-stack --namespace monitoring --values prometheus-values.yaml

# # Install Grafana
# echo "Installing Grafana..."
# helm install grafana grafana/grafana

# # Output Grafana password
# echo "Grafana installed. Retrieve your admin password by running:"
# echo "kubectl get secret --namespace default grafana -o jsonpath=\"{.data.admin-password}\" | base64 --decode ; echo"

# # Confirm the services are running
# echo "Check services with kubectl get services"
# echo "helm list:"
# helm list

helm version

# chmod +x install-monitoring.sh