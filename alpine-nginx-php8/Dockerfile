FROM combro2k/alpine-base:latest

ONBUILD ARG BUILD_DATE=now
ONBUILD ARG VCS_REF=master
ONBUILD ARG VCS_URL=https://github.com/combro2k/dockerfiles/tree/master/alpine-nginx-php8
ONBUILD ARG DOCKERFILE=alpine-nginx-php8/Dockerfile

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

ENV WWW_UID=82 WWW_GID=82

RUN set -xe && apk add --quiet --no-cache --virtual=.run-deps --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing nginx git ca-certificates curl tar php8 php8-fpm php8-curl php8-dom php8-gd php8-iconv php8-xml \
  php8-json php8-pecl-mcrypt php8-pcntl php8-pdo php8-pdo_pgsql php8-pgsql php8-posix php8-mysqli php8-session php8-ctype && adduser -u 82 -D -S -G www-data www-data && \
  ln -sf /dev/stdout /var/log/nginx/access.log && ln -sf /dev/stderr /var/log/nginx/error.log && ln -sf /usr/bin/php8 /usr/bin/php && \
	apk del --quiet --no-cache --purge && rm -rf /var/cache/apk/*

COPY resources/ /

#VOLUME /data/web

EXPOSE 80/tcp

RUN set -xe && chmod +x /usr/bin/composer
