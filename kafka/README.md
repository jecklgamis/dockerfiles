## kafka

Apache Kafka Docker container.

## Building
```
docker build -t jecklgamis/kafka:latest .
```
## Running
```
docker-compose up 
```

Create a topic named `test` 
```
make create-test-topic
```

Open a console consumer on the `test` topic 
```
make start-test-consumer
```
