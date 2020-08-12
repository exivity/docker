#!/usr/bin/env bash

export DOCKER_CLI_EXPERIMENTAL=enabled

docker login -u "$DOCKER_HUB_USER" -p "$DOCKER_HUB_PASSWORD"

docker manifest create "exivity/base:latest" \
  "exivity/base:linux" \
  "exivity/base:windows"

# @todo: is this needed?
# docker manifest annotate "exivity/base:latest" "exivity/base:linux" --os linux --arch amd64
# docker manifest annotate "exivity/base:latest" "exivity/base:windows" --os windows --arch amd64

docker manifest push "exivity/base:latest"
