#!/bin/bash
export KUBECONFIG=/root/.kube/config.aetina
helm upgrade --install kiosk kiosk -f my-values.yaml
