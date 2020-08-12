REM curl --connect-timeout 5 --max-time 60 --retry 1 --user guest:guest http://localhost:15672/api/healthchecks/node

cd "C:/Program Files/RabbitMQ Server/rabbitmq_server-%VERSION%/sbin"
rabbitmqctl.bat ping
