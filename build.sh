docker login -u "$DOCKER_HUB_USER" -p "$DOCKER_HUB_PASSWORD"
docker build -f scripts/Dockerfile.windows -t exivity/base:latest .
docker push exivity/base