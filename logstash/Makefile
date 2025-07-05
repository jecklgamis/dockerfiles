default:
	cat ./Makefile
image:
	docker build -t jecklgamis/logstash:latest .
run:
	docker run jecklgamis/logstash:latest
run-bash:
	docker run -i -t jecklgamis/logstash:latest /bin/bash
up: image run
