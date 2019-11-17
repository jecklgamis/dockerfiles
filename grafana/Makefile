IMAGE_NAME=jecklgamis/grafana
default:
	cat ./Makefile
image:
	docker build -t $(IMAGE_NAME):latest .
run:
	docker run -p 3000:3000 -i -t  $(IMAGE_NAME):latest
run-bash:
	docker run -i -t  $(IMAGE_NAME) /bin/bash
