#!/usr/bin/env bash

export DOCKER_CLI_EXPERIMENTAL=enabled

# Version
docker manifest create "exivity/$IMAGE:$VERSION" \
  "exivity/$IMAGE:$VERSION-linux" \
  "exivity/$IMAGE:$VERSION-windows"

# Latest
docker manifest create "exivity/$IMAGE:latest" \
  "exivity/$IMAGE:latest-linux" \
  "exivity/$IMAGE:latest-windows"

echo $DOCKER_HUB_TOKEN | docker login -u $DOCKER_HUB_USER --password-stdin

docker manifest push "exivity/$IMAGE:$VERSION"
docker manifest push "exivity/$IMAGE:latest"
