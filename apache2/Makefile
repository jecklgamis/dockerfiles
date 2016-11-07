default:
	cat ./Makefile
image:
	docker build -t jecklgamis/apache2:latest .
run:
	docker run -p 8080:80 -p 8443:443 jecklgamis/apache2
run-bash:
	docker run -i -t jecklgamis/apache2 /bin/bash
