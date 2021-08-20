#!/bin/bash
export PROJECT_ID=$(gcloud config list project --format "value(core.project)")
export IMAGE_REPO_NAME=struc2vec
export IMAGE_TAG=latest
export IMAGE_URI=gcr.io/$PROJECT_ID/$IMAGE_REPO_NAME:$IMAGE_TAG

# Login to google container registry
docker login -u _json_key -p "$(cat cp-0308b-ac0671669f20.json)" https://gcr.io

docker push $IMAGE_URI
