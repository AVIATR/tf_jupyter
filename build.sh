#!/bin/bash
IMAGE_NAME="aviatr/tf_jupyter"
TAG=`git rev-parse --abbrev-ref HEAD`
if [ "$TAG" == "master" ]; then
    TAG="latest"
fi
docker build -t "$IMAGE_NAME":"$TAG" .
