default:
	cat ./Makefile
image:
	docker build -t jecklgamis/kafka:latest .
run:
	docker run -p 9092:9092  jecklgamis/kafka:latest
run-bash:
	docker run -i -t jecklgamis/kafka /bin/bash
stack:
	docker-compose down
	docker-compose up
