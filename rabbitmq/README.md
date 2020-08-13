# exivity/rabbitmq

Docker image of Rabbit MQ server.

## Usage

```
docker run --rm --detach \
  -p 4369:4369 -p 5671:5671 -p 5672:5672 -p 15672:15672 \
  --name rabbitmq exivity/rabbitmq:latest
```

## Development

```
export RABBITMQ_VERSION=3.8.6
```

Build:

```
docker build --build-arg VERSION=$RABBITMQ_VERSION --file Dockerfile.windows --tag exivity/rabbitmq:$RABBITMQ_VERSION .
```

Run interactively:

```
docker run --rm -it -p 4369:4369 -p 5671:5671 -p 5672:5672 -p 15672:15672 --name rabbitmq exivity/rabbitmq:$RABBITMQ_VERSION
```

Attach shell to running container:

```
docker exec -it rabbitmq cmd.exe
```

Follow log file:

```
powershell
Get-Content C:\Users\
ContainerAdministrator\AppData\Roaming\RabbitMQ\log\rabbit@HOSTNAME.log Wait
```
