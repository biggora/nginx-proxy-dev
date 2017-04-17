#!/usr/bin/env bash

docker build -t nginx-proxy-dev:1.0.0 .
docker tag nginx-proxy-dev:1.0.0 biggora/nginx-proxy-dev:1.0.0
docker push biggora/nginx-proxy-dev:1.0.0
docker tag nginx-proxy-dev:1.0.0 nginx-proxy-dev:latest
docker tag nginx-proxy-dev:latest biggora/nginx-proxy-dev:latest
docker push biggora/nginx-proxy-dev:latest