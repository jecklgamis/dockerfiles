## wiremock

A Docker container for WireMock standalone server.  WireMock is an open source web service test double.
See `http://wiremock.org/docs/` on how to use WireMock.

## Build and Run
```
make image run
```
Test an example stub : `curl -v http://localhost:7080/example/get`


## Adding Stubs
- Add mapping JSON files in `mappings` dir
- Add response files in `__files` dir
- Re build the Docker image (run `make image`)
