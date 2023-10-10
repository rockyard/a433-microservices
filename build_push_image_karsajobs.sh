#!/bin/bash

# build docker images dari Dockerfile
docker build -t rickjard/karsajobs:latest

# nama image di directory github
docker tag rickjard/karsajobs:latest ghcr.io/rockyard/rickjard/karsajobs:latest

# login github packages
echo $BE_PAT | docker login ghcr.io -u rockyard --password-stdin

# push image ke github packages
docker push ghcr.io/rockyard/rickjard/karsajobs:latest
