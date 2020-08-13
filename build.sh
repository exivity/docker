#!/usr/bin/env bash

cd $IMAGE

if [[ $CI_PLATFORM == 'ubuntu-latest' ]]; then
    PLATFORM=linux
elif [[ $CI_PLATFORM == 'windows-latest' ]]; then
    PLATFORM=windows
fi

DOCKERFILE=Dockerfile.$PLATFORM
VERSION_TAG=$VERSION-$PLATFORM
LATEST_TAG=latest-$PLATFORM

docker build \
    --build-arg VERSION=$VERSION \
    --file $DOCKERFILE \
    --tag exivity/$IMAGE:$VERSION_TAG \
    .

docker tag exivity/$IMAGE:$VERSION_TAG exivity/$IMAGE:$LATEST_TAG

echo $DOCKER_HUB_TOKEN | docker login -u $DOCKER_HUB_USER --password-stdin
docker push exivity/$IMAGE:$VERSION_TAG
docker push exivity/$IMAGE:$LATEST_TAG

