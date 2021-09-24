#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath="jcorrado76/udacity_ml_microservice"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run ml-microservice \
    --image=$dockerpath:ml_model \
    --port=81 \
    --labels app=ml-microservice

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward ml-microservice 81:81
