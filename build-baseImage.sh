#!/bin/bash
export PROJECT_ID=$(gcloud config list project --format "value(core.project)")
export IMAGE_REPO_NAME=struc2vecbase
export IMAGE_TAG=latest
export IMAGE_URI=gcr.io/$PROJECT_ID/$IMAGE_REPO_NAME:$IMAGE_TAG

# Build the docker model
docker build -f Dockerfile-baseimage -t $IMAGE_URI ./
