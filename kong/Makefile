default:
	cat ./Makefile
image: ssl-certs
	docker build -t jecklgamis/kong:latest .
run:
	docker run -p 80:8000 -p 443:8443 -p 8000:8000 -p 8001:8001 -p 8443:8443 -p 8444:8444  -i -t jecklgamis/kong:latest
run-bash:
	docker run -i -t jecklgamis/kong:latest /bin/bash
ssl-certs:
	cd etc/kong/ssl && ./create-server-certs.sh
up: image run