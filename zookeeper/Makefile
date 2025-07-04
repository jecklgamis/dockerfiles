default:
	cat ./Makefile
image:
	docker build -t jecklgamis/zookeeper:latest .
run:
	docker run -p 2181:2181  jecklgamis/zookeeper:latest
run-bash:
	docker run -i -t jecklgamis/zookeeper /bin/bash
up: image run