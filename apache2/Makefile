default:
	cat ./Makefile
image:
	docker build -t jecklgamis/apache2:latest .
run:
	docker run -p 80:80 -p 443:443 jecklgamis/apache2
run-bash:
	docker run -i -t jecklgamis/apache2 /bin/bash
up: image run