#!/bin/bash

# build docker images dari Dockerfile
docker build -t rickjard/karsajobs-ui:latest

# nama image di directory github
docker tag rickjard/karsajobs-ui:latest ghcr.io/rockyard/rickjard/karsajobs-ui:latest

# login github packages
echo $FE_PAT | docker login ghcr.io -u rockyard --password-stdin

# push image ke github packages
docker push ghcr.io/rockyard/rickjard/karsajobs-ui:latest