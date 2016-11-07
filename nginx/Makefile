default:
	cat ./Makefile
image:
	docker build -t jecklgamis/nginx:latest .
run:
	docker run -p 8080:80 -p 8443:443 -i -t jecklgamis/nginx:latest
run-bash:
	docker run -i -t jecklgamis/nginx:latest /bin/bash
ssl-certs:
	cd etc/nginx/ssl && ./create-server-certs.sh
