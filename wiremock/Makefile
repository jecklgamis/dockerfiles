default:
	cat ./Makefile
image:
	docker build -t jecklgamis/wiremock:latest .
run:
	docker run -p 7080:7080  jecklgamis/wiremock:latest
run-bash:
	docker run -i -t jecklgamis/wiremock /bin/bash
