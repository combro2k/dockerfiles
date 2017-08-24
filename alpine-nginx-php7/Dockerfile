FROM combro2k/alpine-base:latest

LABEL \
        org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url="https://github.com/combro2k/dockerfiles/"

RUN set -xe && apk --quiet --no-cache upgrade && apk add --no-cache --virtual=run-deps \
	    nginx git ca-certificates curl tar php7 php7-fpm php7-curl php7-dom php7-gd \
	    php7-json php7-mcrypt php7-pcntl php7-pdo php7-pdo_pgsql php7-pgsql php7-posix php7-mysqli php7-session && \
	    adduser -u 82 -D -S -G www-data www-data

COPY resources/ /

#VOLUME /data/web

EXPOSE 80/tcp

RUN set -xe && apk del --quiet --no-cache --progress --purge && rm -rf /var/cache/apk/* && chmod +x /usr/bin/composer

ENTRYPOINT ["/init"]
