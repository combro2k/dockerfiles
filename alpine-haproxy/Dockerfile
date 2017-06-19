FROM gliderlabs/alpine:edge

RUN set -xe && apk update && apk upgrade && \
	    apk add --no-cache --virtual=run-deps \
	    haproxy curl ca-certificates openssl && \
	    mkdir /app -p && \
	    curl -L -s https://github.com/jwilder/docker-gen/releases/download/0.7.3/docker-gen-alpine-linux-amd64-0.7.3.tar.gz | tar xvzf - -C /app && \
	    curl -L -s https://github.com/just-containers/s6-overlay/releases/download/v1.19.1.1/s6-overlay-amd64.tar.gz | tar xvzf - -C /

COPY resources/etc /etc/
COPY resources/app /app/
COPY resources/data /data/

VOLUME ['/tmp/docker.sock']
#VOLUME ['/data/web']

EXPOSE 80 443 9000

RUN set -xe && apk del --progress --purge && rm -rf /var/cache/apk/* && chmod +x /app/reload-haproxy.sh

ENTRYPOINT ["/init"]
