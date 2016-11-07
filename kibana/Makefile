default:
	cat ./Makefile
image:
	docker build -t jecklgamis/kibana:latest .
run:
	docker run -p 5601:5601 jecklgamis/kibana:latest
run-bash:
	docker run -i -t jecklgamis/kibana:latest /bin/bash
