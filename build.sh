#!/usr/bin/env bash

OS_PREFIX_FOR_LINUX='ubuntu'
OS_PREFIX_FOR_WINDOWS='windows'

if [[ $CI_PLATFORM == "$OS_PREFIX_FOR_LINUX"* ]]; then
    DOCKER_PLATFORM='linux'
    echo 'About to build Docker image for Linux'
elif [[ $CI_PLATFORM == "$OS_PREFIX_FOR_WINDOWS"* ]]; then
    DOCKER_PLATFORM='windows'
    echo 'About to build Docker image for Windows ...'
fi

DOCKERFILE=Dockerfile.$DOCKER_PLATFORM
VERSION_TAG=$VERSION-$DOCKER_PLATFORM
LATEST_TAG=latest-$DOCKER_PLATFORM

# Enter the folder containing Dockerfiles
cd ./postgresql

docker build \
    --build-arg VERSION=$VERSION \
    --build-arg EXTRA_BUILD_ARG=$EXTRA_BUILD_ARG \
    --file $DOCKERFILE \
    --tag $DOCKER_IMAGE:$VERSION_TAG \
    .

docker tag $DOCKER_IMAGE:$VERSION_TAG $DOCKER_IMAGE:$LATEST_TAG

echo $DOCKER_HUB_TOKEN | docker login -u $DOCKER_HUB_USER --password-stdin
docker push $DOCKER_IMAGE:$VERSION_TAG
docker push $DOCKER_IMAGE:$LATEST_TAG