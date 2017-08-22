FROM gliderlabs/alpine:edge

RUN set -xe && \
	    apk --quiet --no-cache upgrade && apk add --quiet --no-cache --virtual=run-deps curl ca-certificates && \
	    curl -L -s https://github.com/just-containers/s6-overlay/releases/download/v1.20.0.0/s6-overlay-amd64.tar.gz | tar zx -C /

COPY resources/ /

RUN set -xe && apk del --quiet --no-cache --progress --purge && rm -rf /var/cache/apk/*

ENTRYPOINT ["/init"]
