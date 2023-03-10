#!/bin/bash

# change image in deployment
kubectl set image deployment/project-deployment agora-project-cotainer=$ECR_REGISTRY/$APP_NAME:$ECR_TAG

# wait for pods to run
while true; do
  running=$(kubectl get pods --field-selector=status.phase=Running | grep -c Running)
  desired=$(kubectl get deployment project-deployment -o=jsonpath='{.spec.replicas}')

  if [ "$running" -eq "$desired" ]; then
    echo "All pods are running!"
    break
  fi

  echo "Waiting for all pods to be running..."
  sleep 5
done
