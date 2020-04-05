default:
	cat ./Makefile

IMAGES = java-runtime openjdk-8-jre openjdk-11-jre nodejs-runtime \
         tomcat apache2 nginx \
         elasticsearch kibana beats logstash \
         mongodb redis couchdb \
         prometheus grafana \
         zookeeper kafka \
         wiremock

image:
	for d in $(IMAGES); do (cd $$d && make image) ; done

