default:
	cat ./Makefile
image: ssl-certs
	docker build -t jecklgamis/nginx:latest .
run:
	docker run -p 80:80 -p 443:443 -i -t jecklgamis/nginx:latest
run-bash:
	docker run -i -t jecklgamis/nginx:latest /bin/bash
ssl-certs:
	cd etc/nginx/ssl && ./create-server-certs.sh
up: image run