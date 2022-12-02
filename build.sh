#!/usr/bin/env bash

# Fail script in case of unset variables - see more here:
# http://web.archive.org/web/20110314180918/http://www.davidpashley.com/articles/writing-robust-shell-scripts.html#id2577541.
set -o nounset

# Fail scripts in case a command fails - see more here:
# http://web.archive.org/web/20110314180918/http://www.davidpashley.com/articles/writing-robust-shell-scripts.html#id2577574.
set -o errexit

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
VERSION_TAG=$POSTGRESQL_VERSION-$DOCKER_PLATFORM
LATEST_TAG=latest-$DOCKER_PLATFORM

# Enter the folder containing Dockerfiles
cd ./postgresql

docker image build \
    --build-arg POSTGRESQL_VERSION=$POSTGRESQL_VERSION \
    --file $DOCKERFILE \
    --tag $DOCKER_IMAGE:$VERSION_TAG \
    .

docker image tag $DOCKER_IMAGE:$VERSION_TAG $DOCKER_IMAGE:$LATEST_TAG

echo $DOCKER_HUB_TOKEN | docker login -u $DOCKER_HUB_USER --password-stdin
docker image push $DOCKER_IMAGE:$VERSION_TAG
docker image push $DOCKER_IMAGE:$LATEST_TAG