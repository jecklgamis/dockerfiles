all:
	cat ./Makefile
image:
	docker build -t jecklgamis/openjdk-11-jre:latest .
run:
	docker run jecklgamis/openjdk-11-jre
run-bash:
	docker run -i -t jecklgamis/openjdk-11-jre:latest /bin/bash
push:
	docker push jecklgamis/openjdk-11-jre:latest
