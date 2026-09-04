IMAGE_NAME:=jecklgamis/kibana
IMAGE_TAG:=latest

default:
	cat ./Makefile
image:
	docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .
run:
	docker run -p 5601:5601 $(IMAGE_NAME):$(IMAGE_TAG)
run-bash:
	docker run -i -t $(IMAGE_NAME):$(IMAGE_TAG) /bin/bash
up: image run
