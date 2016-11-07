default:
	cat ./Makefile
image:
	docker build -t jecklgamis/mongodb:latest .
run:
	docker run -p 27017:27017 jecklgamis/mongodb:latest
run-bash:
	docker run -i -t jecklgamis/mongodb:latest /bin/bash
