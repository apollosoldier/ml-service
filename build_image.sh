#!/bin/bash

# set the image name and tag
IMAGE_NAME=juju
TAG=latest

# build the Docker image
docker build -t $IMAGE_NAME:$TAG .

# set the registry URL
REGISTRY_URL=localhost:5000

# tag the image with the registry URL
docker tag $IMAGE_NAME:$TAG $REGISTRY_URL/$IMAGE_NAME:$TAG

# authenticate with the registry (if required)
# docker login $REGISTRY_URL

# push the image to the registry
docker push $REGISTRY_URL/$IMAGE_NAME:$TAG

# clean up the local images
docker rmi $IMAGE_NAME:$TAG $REGISTRY_URL/$IMAGE_NAME:$TAG
