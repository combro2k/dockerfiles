FROM combro2k/alpine-base:latest

ONBUILD ARG BUILD_DATE=now
ONBUILD ARG VCS_REF=master
ONBUILD ARG VCS_URL=https://github.com/combro2k/dockerfiles/tree/master/alpine-nginx-php82
ONBUILD ARG DOCKERFILE=alpine-nginx-php82/Dockerfile

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

ENV WWW_UID=82 WWW_GID=82

RUN set -xe && apk add --quiet --no-cache --virtual=.run-deps nginx git ca-certificates curl tar php82 php82-fpm php82-curl php82-dom php82-gd php82-iconv php82-xml \
  php82-json php82-pcntl php82-pdo php82-pdo_pgsql php82-pgsql php82-posix php82-mysqli php82-session php82-ctype && adduser -u 82 -D -S -G www-data www-data && \
  ln -sf /dev/stdout /var/log/nginx/access.log && ln -sf /dev/stderr /var/log/nginx/error.log && ln -sf /usr/bin/php82 /usr/bin/php && \
	apk del --quiet --no-cache --purge && rm -rf /var/cache/apk/*

COPY resources/ /

#VOLUME /data/web

EXPOSE 80/tcp

RUN set -xe && chmod +x /usr/bin/composer
