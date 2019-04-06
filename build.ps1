docker login -u "$env:DOCKER_HUB_USER" -p "$env:DOCKER_HUB_PASSWORD"
docker build -f scripts/Dockerfile.windows -t exivity/base:latest .
docker push exivity/base

