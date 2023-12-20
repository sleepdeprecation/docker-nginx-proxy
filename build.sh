#!/usr/bin/env bash

set -x -e

# TODO: write this in a way that works better for CI, for now I'm just running it locally
# so I can get the container out into the world

# INCREMENT THIS WHEN BUILDING A NEW VERSION
VERSION="0.0.1"

IMAGE_REPO="ghcr.io/sleepdeprecation/nginx-proxy"

docker build -t "$IMAGE_REPO:latest" .
docker tag "$IMAGE_REPO:latest" "$IMAGE_REPO:$VERSION"

docker push --all-tags "$IMAGE_REPO"
