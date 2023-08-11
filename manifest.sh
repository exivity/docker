#!/usr/bin/env bash

export DOCKER_CLI_EXPERIMENTAL=enabled

# Create manifests for specific Docker image version
docker manifest create \
  "$DOCKER_IMAGE:$POSTGRESQL_VERSION" \
  "$DOCKER_IMAGE:$POSTGRESQL_VERSION-linux" \
  "$DOCKER_IMAGE:$POSTGRESQL_VERSION-windows"

# Create manifests for latest Docker image version
docker manifest create \
  "$DOCKER_IMAGE:latest" \
  "$DOCKER_IMAGE:latest-linux" \
  "$DOCKER_IMAGE:latest-windows"

# Push manifests to Docker Hub
docker manifest push "$DOCKER_IMAGE:$POSTGRESQL_VERSION"
docker manifest push "$DOCKER_IMAGE:latest"
