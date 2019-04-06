docker -D manifest create "exivity/base:latest" `
  "exivity/base:linux" `
  "exivity/base:windows"
docker manifest annotate "exivity/base:latest" "exivity/base:linux" --os linux --arch amd64
docker manifest annotate "exivity/base:latest" "exivity/base:windows" --os windows --arch amd64
docker manifest push "exivity/base:latest"
