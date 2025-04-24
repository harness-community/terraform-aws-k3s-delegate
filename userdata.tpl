#!/bin/bash

# setup k3s
curl -sfL https://get.k3s.io | sh -
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml

# install delegate
mkdir -p /var/lib/rancher/k3s/server/manifests
kubectl create namespace harness-delegate-ng
echo '---
apiVersion: helm.cattle.io/v1
kind: HelmChart
metadata:
  name: harness-delegate-ng
  namespace: harness-delegate-ng
spec:
  repo: https://app.harness.io/storage/harness-download/delegate-helm-chart
  chart: harness-delegate-ng
  targetNamespace: harness-delegate-ng
  valuesContent: |-
    delegateName: ${DELEGATE_NAME}
    accountId: ${ACCOUNT_ID}
    delegateToken: ${DELEGATE_TOKEN}
    managerEndpoint: ${MANAGER_ENDPOINT}
    delegateDockerImage: ${DELEGATE_DOCKER_IMAGE}
    replicas: ${REPLICAS}
    cpu: 1000m
    memory: 1024
    upgrader:
      enabled: false
' > /var/lib/rancher/k3s/server/manifests/harness-delegate-ng.yaml
