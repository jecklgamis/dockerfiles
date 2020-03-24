## kafka

Apache Kafka Docker container.

## Building
```
docker build -t jecklgamis/kafka:latest .
```
## Running
```
docker run -p 9092:9092  jecklgamis/kafka:latest
```

## Kafka  + Zookeeper  
```
docker-compose up
```

## Testing
```
telnet localhost 9092
```
