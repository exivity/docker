#!/usr/bin/env bash

export DOCKER_CLI_EXPERIMENTAL=enabled

# Version
docker manifest create "satrapu/$IMAGE:$VERSION" \
  "satrapu/$IMAGE:$VERSION-linux" \
  "satrapu/$IMAGE:$VERSION-windows"

# Latest
docker manifest create "satrapu/$IMAGE:latest" \
  "satrapu/$IMAGE:latest-linux" \
  "satrapu/$IMAGE:latest-windows"

echo $DOCKER_HUB_TOKEN | docker login -u $DOCKER_HUB_USER --password-stdin

docker manifest push "satrapu/$IMAGE:$VERSION"
docker manifest push "satrapu/$IMAGE:latest"
