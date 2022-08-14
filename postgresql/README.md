# satrapu/postgresql

Docker image for PostgreSQL server

## Usage

### On Linux with Bash

```shell
docker volume create --name=postgresql_linux_data

docker container run \
  --name postgresql \
  --rm \
  --detach \
  -p 5432:5432 \
  -v postgresql_linux_data:/var/lib/postgresql/data \
  satrapu/postgresql:14.0-linux
```

### On Windows with PowerShell

```powershell
docker volume create --name=postgresql_windows_data

docker container run `
  --name postgresql `
  --rm `
  --detach `
  -p 5432:5432 `
  -v postgresql_windows_data:C:/pgsql/data `
  satrapu/postgresql:14.0-windows
```

**IMPORTANT** A user `postgres` with default password `postgres` has been added to the container.

## Build, tag and publish Docker images

### On Linux with Bash

```shell
export VERSION=14.0

docker image build \
  --build-arg VERSION=$POSTGRESQL_VERSION \
  --file Dockerfile.linux \
  --tag satrapu/postgresql:latest-linux satrapu/postgres:$POSTGRESQL_VERSION-linux \
  .

docker image push satrapu/postgresql:latest-linux
docker image push satrapu/postgresql:$POSTGRESQL_VERSION-linux
```

### On Windows with PowerShell

```powershell
export POSTGRESQL_VERSION=14.0
export EXTRA_BUILD_ARG=14.0-1

docker image build `
  --build-arg POSTGRESQL_VERSION=$POSTGRESQL_VERSION `
  --build-arg EXTRA_BUILD_ARG=$EXTRA_BUILD_ARG `
  --file Dockerfile.windows `
  --tag satrapu/postgresql:latest-windows satrapu/postgresql:$POSTGRESQL_VERSION-windows `
  .

docker image push satrapu/postgresql:latest-windows
docker image push satrapu/postgresql:$POSTGRESQL_VERSION-windows
```
