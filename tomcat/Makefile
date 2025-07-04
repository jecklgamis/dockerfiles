default:
	cat ./Makefile
image:
	docker build -t jecklgamis/tomcat:latest .
run:
	docker run -p 8080:8080  jecklgamis/tomcat:latest
run-bash:
	docker run -i -t jecklgamis/tomcat /bin/bash
up: image run