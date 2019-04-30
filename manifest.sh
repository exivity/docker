#!/usr/bin/env bash

echo '{"experimental":true}' > ~/.docker/config.json
#echo '{"experimental":true}' | sudo tee /etc/docker/daemon.json
sudo service docker restart
docker version -f '{{.Server.Experimental}}'

docker -D manifest create "exivity/base:latest" \
  "exivity/base:linux" \
  "exivity/base:windows"
# @todo: is this needed?
# docker manifest annotate "exivity/base:latest" "exivity/base:linux" --os linux --arch amd64
# docker manifest annotate "exivity/base:latest" "exivity/base:windows" --os windows --arch amd64
docker manifest push "exivity/base:latest"
