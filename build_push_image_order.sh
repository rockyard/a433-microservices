#!/bin/bash

# build docker image
docker build . -t ghcr.io/rockyard/order-service:latest

# login github packages
echo $ORDER_PAT | docker login --username rockyard --password-stdin ghcr.io

# push image ke github packages
docker push ghcr.io/rockyard/order-service:latest