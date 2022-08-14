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
    --build-arg EXTRA_BUILD_ARG=$EXTRA_BUILD_ARG \
    --file $DOCKERFILE \
    --tag satrapu/$IMAGE:$VERSION_TAG \
    .

docker tag satrapu/$IMAGE:$VERSION_TAG satrapu/$IMAGE:$LATEST_TAG

echo $DOCKER_HUB_TOKEN | docker login -u $DOCKER_HUB_USER --password-stdin
docker push satrapu/$IMAGE:$VERSION_TAG
docker push satrapu/$IMAGE:$LATEST_TAG

