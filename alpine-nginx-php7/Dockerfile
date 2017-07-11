FROM gliderlabs/alpine:edge

RUN set -xe && apk --quiet --no-cache upgrade && apk add --no-cache --virtual=run-deps \
	    nginx git ca-certificates curl tar php7 php7-fpm php7-curl php7-dom php7-gd \
	    php7-json php7-mcrypt php7-pcntl php7-pdo php7-pdo_pgsql php7-pgsql php7-posix php7-mysqli php7-session && \
	    adduser -u 82 -D -S -G www-data www-data && \
	    curl -L -s https://github.com/just-containers/s6-overlay/releases/download/v1.19.1.1/s6-overlay-amd64.tar.gz | tar zx -C /

COPY resources/etc /etc/
COPY resources/data /data/
COPY resources/usr/bin /usr/bin/

#VOLUME /data/web

EXPOSE 80/tcp

RUN set -xe && apk del --quiet --no-cache --progress --purge && rm -rf /var/cache/apk/* && chmod +x /usr/bin/composer

ENTRYPOINT ["/init"]
