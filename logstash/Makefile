IMAGE_NAME:=jecklgamis/logstash
IMAGE_TAG:=latest

default:
	cat ./Makefile
image:
	docker build --platform linux/amd64  -t $(IMAGE_NAME):$(IMAGE_TAG) .
run:
	docker run --platform linux/amd64 $(IMAGE_NAME):$(IMAGE_TAG)
run-bash:
	docker run -u 0  --platform linux/amd64 -i -t $(IMAGE_NAME):$(IMAGE_TAG) /bin/bash
up: image run
