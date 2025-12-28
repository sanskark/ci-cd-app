#!/bin/bash
set -e

APP_NAME=ci-cd-app
IMAGE=$1

docker stop $APP_NAME || true
docker rm $APP_NAME || true

docker run -d --name $APP_NAME -p 5000:5000 $IMAGE
