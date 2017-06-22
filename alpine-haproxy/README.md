# alpine-haproxy
alpine-haproxy

### Usage

```
docker run -d -v /var/run/docker.sock:/tmp/docker.sock:ro combro2k/alpine-haproxy:latest

docker run -d -e DOCKER_ENPOINT=tcp://172.42.0.1:4242 combro2k/alpine-haproxy:latest
```

