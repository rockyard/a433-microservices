#!/bin/bash

# build docker image
docker build . -t ghcr.io/rockyard/shipping-service:latest

# login github packages
echo $SHIP_PAT | docker login --username rockyard --password-stdin ghcr.io

# push image ke github packages
docker push ghcr.io/rockyard/shipping-service:latest