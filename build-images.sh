#!/usr/bin/env bash

docker build -t nginx-proxy-dev .
docker tag nginx-proxy-dev biggora/nginx-proxy-dev
docker push biggora/nginx-proxy-dev