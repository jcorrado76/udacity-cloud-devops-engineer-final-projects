#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
# dockerpath=<your docker ID/path>
dockerpath="jcorrado76/udacity_ml_microservice"

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker tag ml_model $dockerpath:ml_model

# Step 3:
# Push image to a docker repository
docker push jcorrado76/udacity_ml_microservice:ml_model
