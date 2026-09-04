## jecklgamis/kong

A Kong Gateway 3.9 (DB-less mode) Docker container, built from Kong's official APT
repository (https://packages.konghq.com).

## Getting Started
Build and run the container:
```
make image run
```

* Proxy: `http://localhost:8000`
* Admin API: `http://localhost:8001`

Kong runs in [declarative (DB-less) mode](https://docs.konghq.com/gateway/latest/production/deployment-topologies/db-less-and-declarative-config/)
using `etc/kong/kong.yml`, which declares an example `google-service` routed at `/google`.
Test it with:
```
curl http://localhost:8000/google
```


