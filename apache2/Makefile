IMAGE_NAME:=jecklgamis/apache2
IMAGE_TAG:=latest

default:
	cat ./Makefile
image:
	docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .
run:
	docker run -p 80:80 -p 443:443 $(IMAGE_NAME):$(IMAGE_TAG)
run-bash:
	docker run -i -t $(IMAGE_NAME)/$(IMAGE_TAG) /bin/bash
up: image run