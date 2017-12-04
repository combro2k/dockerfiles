FROM combro2k/alpine-base:latest

RUN set -xe && apk add --quiet --no-cache --virtual=run-deps ca-certificates curl tar lighttpd lighttpd-mod_auth apache2-utils pwgen && \
	mkdir -p /data/webui && curl --location https://github.com/posty/posty_webui/archive/master.tar.gz | tar zx -C /data/webui --strip-components=1 && \
	apk del --quiet --no-cache --progress --purge && rm -rf /var/cache/apk/*

COPY resources/ /

VOLUME /data/config

EXPOSE 80/tcp
