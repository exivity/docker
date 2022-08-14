#!/usr/bin/env bash

export DOCKER_CLI_EXPERIMENTAL=enabled

# Version
docker manifest create \
  "satrapu/$IMAGE:$POSTGRESQL_VERSION" \
  "satrapu/$IMAGE:$POSTGRESQL_VERSION-linux" \
  "satrapu/$IMAGE:$POSTGRESQL_VERSION-windows"

# Latest
docker manifest create `
  "satrapu/$IMAGE:latest" \
  "satrapu/$IMAGE:latest-linux" \
  "satrapu/$IMAGE:latest-windows"

echo $DOCKER_HUB_TOKEN | docker login -u $DOCKER_HUB_USER --password-stdin

docker manifest push "satrapu/$IMAGE:$POSTGRESQL_VERSION"
docker manifest push "satrapu/$IMAGE:latest"
