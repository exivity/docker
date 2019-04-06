#!/usr/bin/env bash

if [[ $TRAVIS_OS_NAME == 'linux' ]]; then
    DOCKERFILE=Dockerfile
elif [[ $TRAVIS_OS_NAME == 'windows' ]]; then
    DOCKERFILE=Dockerfile.windows
fi

docker login -u "$DOCKER_HUB_USER" -p "$DOCKER_HUB_PASSWORD"
docker build -f "$DOCKERFILE" -t exivity/base:latest .
docker push exivity/base
