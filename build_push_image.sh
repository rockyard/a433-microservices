#!/bin/bash

# membuat docker image dari Dockerfile item-app dengan tag v1
docker build -t item-app:v1 .

# melihat daftar image di local 
docker images

# menyesuaikan nama image dengan format directory github packages
docker tag item-app:v1 ghcr.io/rockyard/item-app:v1

# login ke github packages
$ echo $CR_PAT | docker login ghcr.io -u rockyard --password-stdin

# unggah image dari dockerfile ke github packages
docker push ghcr.io/rockyard/item-app:v1
