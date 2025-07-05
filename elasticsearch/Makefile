IMAGE_NAME:=jecklgamis/elasticsearch
IMAGE_TAG:=latest
PLATFORM:=linux/amd64

default:
	cat ./Makefile
image:
	docker build --platform $(PLATFORM) -t $(IMAGE_NAME):$(IMAGE_TAG) .
run:
	docker run --platform $(PLATFORM) -p 9200:9200 -p 9300:9300 $(IMAGE_NAME):$(IMAGE_TAG)
run-bash:
	docker run -i -t $(IMAGE_NAME):$(IMAGE_TAG) /bin/bash
up: image run