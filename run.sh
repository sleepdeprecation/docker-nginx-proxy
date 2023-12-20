#!/usr/bin/env bash

docker run --init --name nginx-proxy \
  -e PORT=8888 -e BASE_URL=https://mast.fslurs.gay/ -e ALLOWED_PATHS="/@sleep,/about" \
  -p 8888:8888 nginx-proxy
