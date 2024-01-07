FROM combro2k/alpine-base:latest

ONBUILD ARG BUILD_DATE=now
ONBUILD ARG VCS_REF=master
ONBUILD ARG VCS_URL=https://github.com/combro2k/dockerfiles/tree/master/alpine-nginx-php83
ONBUILD ARG DOCKERFILE=alpine-nginx-php83/Dockerfile

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

ENV WWW_UID=82 WWW_GID=82

RUN set -xe && apk add --quiet --no-cache --virtual=.run-deps --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing nginx git ca-certificates curl tar php83 php83-fpm php83-curl php83-dom php83-gd php83-iconv php83-xml \
  php83-json php83-pecl-mcrypt php83-pcntl php83-pdo php83-pdo_pgsql php83-pgsql php83-posix php83-mysqli php83-session php83-ctype && adduser -u 82 -D -S -G www-data www-data && \
  ln -sf /dev/stdout /var/log/nginx/access.log && ln -sf /dev/stderr /var/log/nginx/error.log && ln -sf /usr/bin/php83 /usr/bin/php && \
	apk del --quiet --no-cache --purge && rm -rf /var/cache/apk/*

COPY resources/ /

#VOLUME /data/web

EXPOSE 80/tcp

RUN set -xe && chmod +x /usr/bin/composer
