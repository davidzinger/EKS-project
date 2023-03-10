#!/bin/bash
# waits for image uploading to ECR, if it takes too long it will echo "failed ..." and will exit
while ! aws ecr describe-images --repository-name $APP_NAME --image-ids imageTag=$ECR_TAG; do 
  echo "Waiting for Docker image to be available in ECR registry..."; 
  sleep 5; 
  counter=$((counter+1));
  if [ $counter -eq 100 ]; then
    echo "Failed to pull Docker image after 100 attempts. Exiting loop."
    exit 1
  fi
done
