#!/usr/bin/env bash

if [[ $CI_PLATFORM == 'ubuntu-latest' ]]; then
    PLATFORM=linux
elif [[ $CI_PLATFORM == 'windows-latest' ]]; then
    PLATFORM=windows
fi

LATEST_TAG=latest-$PLATFORM

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

  echo "Got status $status"

  [[ $status == "\"healthy\"" ]]
}

set -e

echo "Running Docker image exivity/$IMAGE:$LATEST_TAG in a container named test"
docker run \
    --rm \
    --detach \
    --name test \
    exivity/$IMAGE:$LATEST_TAG

echo "Running health check"
# retry 6 means we will wait max 1+2+4+8+16 seconds
retry 6 check_if_healthy || (docker inspect test && exit 1)

echo "Stop Docker container test"
docker stop test
