# exivity/postgres

Docker image of PostgreSQL server

## Usage

```
docker run --rm --detach \
  -p 5432:5432 \
  --name postgres exivity/postgres:latest
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
  --build-arg VERSION=$VERSION \
  --build-arg EXTRA_BUILD_ARG=$EXTRA_BUILD_ARG \
  --file Dockerfile.windows \
  --tag exivity/postgres:$VERSION \
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
  --build-arg VERSION=$VERSION \
  --file Dockerfile.linux \
  --tag exivity/postgres:$VERSION \
  .
```
