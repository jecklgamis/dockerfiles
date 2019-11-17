# dockerfiles

Docker containers based on `ubuntu:18.04`. 

* apache2 - Apache 2 (http://httpd.apache.org)
* nginx -  Nginx (http://www.nginx.org) 
* tomcat -  Tomcat 9 (http://tomcat.apache.org) 
* elasticsearch - Elasticsearch (https://www.elastic.co/products/elasticsearch) 
* kibana - Kibana (https://www.elastic.co/products/kibana)
* logstash - Logstash (https://www.elastic.co/products/logstash) 
* beats - Beats (https://www.elastic.co/products/beats) 
* java-runtime, openjdk-8-jre - OpenJDK 8 JRE (http://openjdk.java.net)
* openjdk-11-jre - OpenJDK 11 JRE (http://openjdk.java.net)
* nodejs-runtime - NodeJS (https://nodejs.org/en/)
* mongodb - MongoDB database server (https://www.mongodb.com)
* couchdb - CouchDB database server (http://couchdb.apache.org)
* prometheus - Prometheus server (http://prometheus.io/)
* wiremock - WireMock standalone server (http://wiremock.org/)

## Running Images
Example to build and run nginx image. 
```
cd nginx
docker build -t jecklgamis/nginx:latest .
docker run -p 8080:80 -i -t jecklgamis/nginx:latest
````

To run the bash shell instead of the default entry point
```
docker run -i -t jecklgamis/nginx:latest /bin/bash
```

Each image directory contains Makefile that wraps the Docker commands.
The above commands can be simply executed as

```
cd nginx
make image run
```
or `make run-bash` to run the bash shell. Type `make` to see the targets you can execute.

## Image Specific Details
 
### Apache 2
```
cd apache2; make image run
```
Point your browser to `http://localhost:8080`.

### Tomcat
```
cd tomcat; make image run
```
* Point your browser to `http://localhost:8080`.

### Nginx
```
cd nginx; make image run
```
* Point your browser to `http://localhost:8080`.

### CouchDB
```
cd couchdb; make image run
```
* Point your browser to `http://localhost:5184/_utils`.

### Elasticsearch
```
cd elasticsearch; make image run
```
* Point your browser to `http://localhost:9200`.

### MongoDB
```
cd mongodb; make image run
```
* Connect to the instance using the default port (26017)

### Redis
```
cd redis; make image run
```
* Connect to the instance using the default port (6379)

### Kibana
```
cd kibana; make image run
```
* Point your browser to `http://localhost:5601`.  Note that this requires ES url 
`http://es.local:9200`. You can create /etc/hosts entry `127.0.0.1 es.local` that will
point to your local ES instance.

### Beats
This image contains the filebeat, metricbeat, packetbeat, and topbeat data shippers and default
dashboards.

```
cd beats; make image run
```

### OpenJDK Java 8
```
cd java-runtime; make image run
```
This simply runs `java -version`. You'll usually use this as base image to your JVM app image.

### Oracle Java 8 
```
cd oracle-java-runtime; make image run
```
This simply runs `java -version`. You'll usually use this as base image to your JVM app image.

### NodeJS Runtime
```
cd node-js-runtime; make image run
```

## Docker Compose Stacks

### Elasticsearch + Kibana + Beats Dashboards
This stack consists of Kibana, Elasticsearch, and Beats dashboards. 

```
cd stacks/es-kibana-beats
make stack
```

Point your browser to `http://localhost:5601` to see the Kibana UI.

### Elasticsearch + Kibana + Beats Dashboards + NodeJS Example App
```
cd stacks/nodejs-app
make stack
```
