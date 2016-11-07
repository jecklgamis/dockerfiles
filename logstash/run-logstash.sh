#!/bin/bash
set -ex
cd /usr/local/logstash/bin
exec /usr/local/logstash/bin/logstash -f /usr/local/logstash/bin/logstash.conf

