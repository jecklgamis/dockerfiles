all:
	cat ./Makefile
image:
	docker build -t jecklgamis/java-runtime:latest .
run:
	docker run jecklgamis/java-runtime
run-bash:
	docker run -i -t jecklgamis/java-runtime:latest /bin/bash
