#!/usr/bin/env bash

OS_PREFIX_FOR_LINUX='ubuntu'
OS_PREFIX_FOR_WINDOWS='windows'

if [[ $CI_PLATFORM == "$OS_PREFIX_FOR_LINUX"* ]]; then
    DOCKER_PLATFORM='linux'
    echo 'About to test Linux Docker container ...'
elif [[ $CI_PLATFORM == "$OS_PREFIX_FOR_WINDOWS"* ]]; then
    DOCKER_PLATFORM='windows'
    echo 'About to test Windows Docker container ...'
fi

LATEST_TAG=latest-$DOCKER_PLATFORM

# https://gist.github.com/sj26/88e1c6584397bb7c13bd11108a579746
function retry {
  local retries=$1
  shift

  local count=0

  until "$@"; do
    exit=$?
    wait=$((2 ** $count))
    count=$(($count + 1))

    if [ $count -lt $retries ]; then
      echo "Retry $count/$retries exited $exit, retrying in $wait seconds..."
      sleep $wait
    else
      echo "Retry $count/$retries exited $exit, no more retries left."
      return $exit
    fi
  done

  return 0
}

function get_health_status {
  docker inspect --format="{{json .State.Health.Status}}" test
}

function check_if_healthy {
  status=`get_health_status`

  echo "Got status: $status"

  [[ $status == "\"healthy\"" ]]
}

set -e

echo "Running Docker image $DOCKER_IMAGE:$LATEST_TAG in a container named 'test' ..."
docker container run \
  --rm \
  --detach \
  --name test \
  $DOCKER_IMAGE:$LATEST_TAG

echo "Running health check ..."
# retry 6 means we will wait max 1+2+4+8+16 seconds
retry 6 check_if_healthy || (docker inspect test && exit 1)

echo "Stopping Docker container 'test' ..."
docker stop test
echo 'Docker container has been successfully stopped'
