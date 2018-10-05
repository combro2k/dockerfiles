# alpine-haproxy

[![](https://images.microbadger.com/badges/version/combro2k/alpine-haproxy.svg)](https://microbadger.com/images/combro2k/alpine-haproxy "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/combro2k/alpine-haproxy.svg)](https://microbadger.com/images/combro2k/alpine-haproxy "Get your own image badge on microbadger.com")

### Usage

```
docker run -d -v /var/run/docker.sock:/tmp/docker.sock:ro combro2k/alpine-haproxy:latest

docker run -d -e DOCKER_ENPOINT=tcp://172.42.0.1:4242 combro2k/alpine-haproxy:latest
```

### VHOST Variables

```
  
  VIRTUAL_HOST
  VIRTUAL_SSL_HOST
  VHOST_SSL_ONLY
  VHOST_WHITELIST
  VIRTUAL_PORT
  VIRTUAL_SSL_PORT

```
