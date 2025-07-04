default:
	cat ./Makefile
image:
	docker build -t jecklgamis/kafka:latest .
run:
	docker run -p 9092:9092  jecklgamis/kafka:latest
run-bash:
	docker run -i -t jecklgamis/kafka /bin/bash
exec-bash:
	docker exec -it `docker ps | grep "jecklgamis/kafka" | awk '{print $$1}'` /bin/bash
up: image run
stack:
	docker-compose down
	docker-compose up
create-test-topic:
	docker exec -it `docker ps | grep "jecklgamis/kafka" | awk '{print $$1}'` /kafka/bin/kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic test
start-test-consumer:
	docker exec -it `docker ps | grep "jecklgamis/kafka" | awk '{print $$1}'` /kafka/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic test --from-beginning

