# nodejs-app

An example nodejs app of using beats log shippers (filebeat, metricbeat, packetbeat), elasticsearch 
and kibana.

# Starting The Stack
```
make stack
```

# The Example App
The example app is an HTTP server that simply returns the body of the request wrapped in JSON. The app is started
by `supervisord` and logs in `/var/log/app`. See `app-supervisor.conf`.
```
$ curl -v http://localhost:8080/
*   Trying ::1...
* Connected to localhost (::1) port 8080 (#0)
> GET / HTTP/1.1
> Host: localhost:8080
> User-Agent: curl/7.43.0
> Accept: */*
> 
< HTTP/1.1 200 OK
< X-Source: http-server.js
< Date: Sat, 12 Nov 2016 20:30:49 GMT
< Connection: keep-alive
< Content-Length: 23
< 
* Connection #0 to host localhost left intact
{"ok":"true","body":""}
```

To see the app logs in Kibana, point your browser to http://localhost:5601. 
 



