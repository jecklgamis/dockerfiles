default:
	cat ./Makefile

IMAGES = java-runtime nodejs-runtime apache2 nginx elasticsearch kibana beats logstash tomcat mongodb

image:
	for d in $(IMAGES); do (cd $$d && make image) ; done

elastic-stack:
	docker-compose -f docker-compose-elastic.yml down --remove-orphans
	docker-compose -f docker-compose-elastic.yml up --remove-orphans
