default:
	cat ./Makefile
image:
	docker build -t jecklgamis/prometheus:latest .
run:
	docker run -p 9090:9090  jecklgamis/prometheus:latest
run-bash:
	docker run -i -t jecklgamis/prometheus /bin/bash
exec-bash:
	docker exec -it `docker ps | grep "jecklgamis/prometheus" | awk '{print $$1}'` /bin/bash
up: image run