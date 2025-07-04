IMAGE_NAME=jecklgamis/java-21-runtme
IMAGE_TAG:=latest

default:
	cat ./Makefile
image:
	docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .
run:
	docker run -p 3000:3000 -i -t  $(IMAGE_NAME):$(IMAGE_TAG)
run-bash:
	docker run -i -t  $(IMAGE_NAME) /bin/bash
up: image run