default:
	cat ./Makefile
image:
	docker build -t jecklgamis/elasticsearch:latest .
run:
	docker run -p 9200:9200 -p 9300:9300 jecklgamis/elasticsearch:latest
run-bash:
	docker run -i -t jecklgamis/elasticsearch /bin/bash
