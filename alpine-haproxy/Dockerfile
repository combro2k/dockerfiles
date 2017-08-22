FROM gliderlabs/alpine:edge

ENV DOCKER_ENDPOINT=unix:///tmp/docker.sock

RUN set -xe && \
	    apk --quiet --no-cache upgrade && apk add --quiet --no-cache --virtual=run-deps haproxy curl ca-certificates openssl && mkdir /app -p && \
	    curl -L -s https://github.com/jwilder/docker-gen/releases/download/0.7.3/docker-gen-alpine-linux-amd64-0.7.3.tar.gz | tar zx -C /app && \
	    curl -L -s https://github.com/just-containers/s6-overlay/releases/download/v1.20.0.0/s6-overlay-amd64.tar.gz | tar zx -C /

COPY resources/ /

#VOLUME /tmp/docker.sock

EXPOSE 80/tcp 443/tcp 9000/tcp

RUN set -xe && apk del --quiet --no-cache --progress --purge && rm -rf /var/cache/apk/* && chmod +x /app/reload-haproxy.sh

ENTRYPOINT ["/init"]
