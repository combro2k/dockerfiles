FROM alpine:3.8

ONBUILD ARG BUILD_DATE=now
ONBUILD ARG VCS_REF=master
ONBUILD ARG VCS_URL=https://github.com/combro2k/dockerfiles/tree/master/alpine-nginx-php5
ONBUILD ARG DOCKERFILE=alpine-nginx-php5/Dockerfile

ENV WWW_UID=82 WWW_GID=82

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

RUN set -xe && (apk --quiet --no-cache upgrade || true) && \
  apk add --quiet --no-cache --virtual=.term-deps rxvt-unicode-terminfo && \
  set -xe && apk add --quiet --no-cache --virtual=.run-deps nginx git ca-certificates curl tar php5 php5-fpm php5-curl \
  php5-dom php5-gd php5-json php5-mcrypt shadow php5-pcntl php5-pdo php5-pdo_pgsql php5-pgsql php5-posix php5-mysqli && \
  curl --location --silent https://github.com/just-containers/s6-overlay/releases/download/v1.22.1.0/s6-overlay-amd64.tar.gz | tar zx -C / && \
  ln -s /usr/bin/php5 /usr/bin/php && adduser -u 82 -D -S -G www-data www-data && \
  ln -sf /dev/stdout /var/log/nginx/access.log && ln -sf /dev/stderr /var/log/nginx/error.log && \
	apk del --quiet --no-cache --purge && rm -rf /var/cache/apk/*

COPY resources/ /

# VOLUME /data/web

EXPOSE 80/tcp

RUN set -xe && chmod +x /usr/bin/composer
