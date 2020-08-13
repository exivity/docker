# exivity/postgres

Docker image of PostgreSQL server (Windows only).

## Usage

```
docker run --rm --detach \
  -p 5432:5432 \
  --name postgres exivity/postgres:latest
```

## Development

```
export POSTGRES_VERSION=12.3-2
```

Build:

```
docker build --build-arg VERSION=$POSTGRES_VERSION --file Dockerfile.windows --tag exivity/postgres:$POSTGRES_VERSION .
```
