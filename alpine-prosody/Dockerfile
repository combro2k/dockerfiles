FROM alpine:edge

RUN apk --no-cache --progress add curl prosody lua5.1-lzlib openssl && \
	curl -L -s https://github.com/just-containers/s6-overlay/releases/download/v1.19.1.1/s6-overlay-amd64.tar.gz | tar zx -C /

COPY resources/etc/ /etc/

RUN set -xe && apk del --quiet --no-cache --progress --purge && rm -rf /var/cache/apk/*

VOLUME /var/lib/prosody /prosody

EXPOSE 5222/tcp 5269/tcp

ENTRYPOINT ["/init"]
