FROM gliderlabs/alpine

RUN set -xe && apk --no-cache upgrade && \
	apk add --no-cache --virtual=run-deps ca-certificates curl tar lighttpd lighttpd-mod_auth apache2-utils pwgen && \
	curl -L -s https://github.com/just-containers/s6-overlay/releases/download/v1.19.1.1/s6-overlay-amd64.tar.gz | tar zx -C / && \
	mkdir -p /data/webui && curl --location https://github.com/posty/posty_webui/archive/master.tar.gz | tar zx -C /data/webui --strip-components=1

COPY resources/etc /etc/
COPY resources/data /data/

RUN set -xe && apk del --no-cache --progress --purge && rm -rf /var/cache/apk/*

VOLUME /data/config

EXPOSE 80/tcp

ENTRYPOINT ["/init"]
