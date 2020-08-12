#!/usr/bin/env bash

if [[ $CI_PLATFORM == 'ubuntu-latest' ]]; then
    DOCKERFILE=Dockerfile.linux
    TAG=linux
elif [[ $CI_PLATFORM == 'windows-latest' ]]; then
    DOCKERFILE=Dockerfile.windows
    TAG=windows
fi

docker login -u "$DOCKER_HUB_USER" -p "$DOCKER_HUB_PASSWORD"
docker build -f "$DOCKERFILE" -t exivity/base:$TAG .
docker push exivity/base:$TAG
