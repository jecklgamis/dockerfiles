IMAGE_NAME:=jecklgamis/kong
IMAGE_TAG:=latest
PLATFORM:=linux/amd64

default:
	cat ./Makefile
image:
	docker build --platform $(PLATFORM) -t $(IMAGE_NAME):$(IMAGE_TAG) .
run:
	docker run --platform $(PLATFORM) -p 80:8000 -p 443:8443 -p 8000:8000 -p 8001:8001 -p 8443:8443 -p 8444:8444 -i -t $(IMAGE_NAME):$(IMAGE_TAG)
run-bash:
	docker run --platform $(PLATFORM) -i -t $(IMAGE_NAME):$(IMAGE_TAG) /bin/bash
up: image run
