FROM gliderlabs/alpine:edge

LABEL \
        org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url="https://github.com/combro2k/dockerfiles/"

RUN set -xe && apk --quiet --no-cache upgrade && apk add --no-cache --virtual=run-deps \
	    nginx git ca-certificates curl tar \
	    php5 php5-fpm php5-curl php5-dom php5-gd php5-json php5-mcrypt php5-pcntl php5-pdo php5-pdo_pgsql php5-pgsql php5-posix php5-mysqli && \
	    ln -s /usr/bin/php5 /usr/bin/php && adduser -u 82 -D -S -G www-data www-data && \
	    curl -L -s https://github.com/just-containers/s6-overlay/releases/download/v1.20.0.0/s6-overlay-amd64.tar.gz | tar zx -C /

COPY resources/etc /etc/
COPY resources/data /data/
COPY resources/usr/bin /usr/bin/

# VOLUME /data/web

EXPOSE 80/tcp

RUN set -xe && apk del --quiet --no-cache --progress --purge && rm -rf /var/cache/apk/* && chmod +x /usr/bin/composer

ENTRYPOINT ["/init"]
