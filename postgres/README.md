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

```
export POSTGRES_VERSION=13.0-1
```

Build:

```
docker build --build-arg VERSION=$POSTGRES_VERSION --file Dockerfile.windows --tag exivity/postgres:$POSTGRES_VERSION .
```
