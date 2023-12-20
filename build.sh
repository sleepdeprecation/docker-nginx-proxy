#!/usr/bin/env bash

set -x -e

# TODO: write this in a way that works better for CI, for now I'm just running it locally
# so I can get the container out into the world

# INCREMENT THIS WHEN BUILDING A NEW VERSION
VERSION="0.0.2"

IMAGE_REPO="ghcr.io/sleepdeprecation/nginx-proxy"

docker buildx build --push \
  --platform linux/amd64,linux/arm64 \
  --tag "$IMAGE_REPO:$VERSION" --tag "$IMAGE_REPO:latest" .
