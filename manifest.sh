#!/usr/bin/env bash

export DOCKER_CLI_EXPERIMENTAL=enabled

# Version
docker manifest create \
  "satrapu/$DOCKER_IMAGE:$POSTGRESQL_VERSION" \
  "satrapu/$DOCKER_IMAGE:$POSTGRESQL_VERSION-linux" \
  "satrapu/$DOCKER_IMAGE:$POSTGRESQL_VERSION-windows"

# Latest
docker manifest create `
  "satrapu/$DOCKER_IMAGE:latest" \
  "satrapu/$DOCKER_IMAGE:latest-linux" \
  "satrapu/$DOCKER_IMAGE:latest-windows"

echo $DOCKER_HUB_TOKEN | docker login -u $DOCKER_HUB_USER --password-stdin

docker manifest push "$DOCKER_IMAGE:$POSTGRESQL_VERSION"
docker manifest push "$DOCKER_IMAGE:latest"
