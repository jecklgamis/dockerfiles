default:
	cat ./Makefile
image:
	docker build -t jecklgamis/couchdb:latest .
run:
	docker run -p 5984:5984 jecklgamis/couchdb:latest
run-bash:
	docker run -i -t jecklgamis/couchdb /bin/bash
