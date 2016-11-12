default:
	cat ./Makefile

IMAGES = java-runtime nodejs-runtime apache2 nginx elasticsearch kibana beats logstash tomcat mongodb

image:
	for d in $(IMAGES); do (cd $$d && make image) ; done

