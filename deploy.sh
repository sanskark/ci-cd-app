#!/bin/bash
set -e

APP_NAME=ci-cd-app
IMAGE=$1

# validate script
if [ -z "$IMAGE" ]; then
  echo "Error: No image provided. Usage: bash deploy.sh <image>"
  exit 1
fi

echo "Deploying $IMAGE..."

docker pull "$IMAGE"

docker stop $APP_NAME || true
docker rm $APP_NAME || true

docker run -d --name $APP_NAME -p 5000:5000 "$IMAGE"

echo "Done! $APP_NAME is running on port 5000"
