#!/usr/bin/env bash

# @todo: verify experimental is enabled
# echo '{ "experimental": "enabled" }' > ~/.docker/config.json

docker -D manifest create "exivity/base:latest" \
  "exivity/base:linux" \
  "exivity/base:windows"
# @todo: is this needed?
# docker manifest annotate "exivity/base:latest" "exivity/base:linux" --os linux --arch amd64
# docker manifest annotate "exivity/base:latest" "exivity/base:windows" --os windows --arch amd64
docker manifest push "exivity/base:latest"
