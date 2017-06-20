FROM gliderlabs/alpine:edge

RUN set -xe && apk update && apk upgrade && \
	    apk add --no-cache --virtual=run-deps \
	    nginx git ca-certificates curl tar \
	    php5 php5-fpm php5-curl php5-dom php5-gd php5-json php5-mcrypt php5-pcntl php5-pdo php5-pdo_pgsql php5-pgsql php5-posix php5-mysqli && \
	    ln -s /usr/bin/php5 /usr/bin/php && adduser -u 82 -D -S -G www-data www-data && \
	    curl -L -s https://github.com/just-containers/s6-overlay/releases/download/v1.19.1.1/s6-overlay-amd64.tar.gz | tar zx -C /

COPY resources/etc /etc/
COPY resources/data /data/

VOLUME ['/data/web']

EXPOSE 80

RUN set -xe && apk del --progress --purge && rm -rf /var/cache/apk/*

ENTRYPOINT ["/init"]
