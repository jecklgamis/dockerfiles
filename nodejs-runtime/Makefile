all:
	cat ./Makefile
image:
	docker build -t jecklgamis/nodejs-runtime:latest .
run:
	docker run jecklgamis/nodejs-runtime
run-bash:
	docker run -i -t jecklgamis/nodejs-runtime:latest /bin/bash
