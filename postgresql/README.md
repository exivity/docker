# satrapu/postgres

Docker image for PostgreSQL server

## Usage

```
docker run --rm --detach \
  -p 5432:5432 \
  --name postgres satrapu/postgres:latest
```

A user `postgres` with default password `postgres` is available.

## Development

### Windows:

```
export VERSION=14.0
export EXTRA_BUILD_ARG=14.0-1
```

Build:

```
docker build \
  --build-arg VERSION=$POSTGRESQL_VERSION \
  --build-arg EXTRA_BUILD_ARG=$EXTRA_BUILD_ARG \
  --file Dockerfile.windows \
  --tag satrapu/postgres:$POSTGRESQL_VERSION \
  .
```

### Linux

Windows:

```
export VERSION=14.0
```

Build:

```
docker build \
  --build-arg VERSION=$POSTGRESQL_VERSION \
  --file Dockerfile.linux \
  --tag satrapu/postgres:$POSTGRESQL_VERSION \
  .
```
