default:
	cat ./Makefile
image:
	docker build -t jecklgamis/redis:latest .
run:
	docker run -p 6379:6379 jecklgamis/redis:latest
run-bash:
	docker run -i -t jecklgamis/redis /bin/bash
