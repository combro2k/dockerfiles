FROM combro2k/alpine-base:latest

ONBUILD ARG BUILD_DATE=now
ONBUILD ARG VCS_REF=master
ONBUILD ARG VCS_URL=https://github.com/combro2k/dockerfiles/tree/master/alpine-nginx-php7
ONBUILD ARG DOCKERFILE=alpine-nginx-php7/Dockerfile

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

ENV WWW_UID=82 WWW_GID=82

RUN set -xe && apk add --quiet --no-cache --virtual=.run-deps nginx git ca-certificates curl tar php7 php7-fpm php7-curl php7-dom php7-gd php7-iconv php7-xml \
  php7-json php7-mcrypt php7-pcntl php7-pdo php7-pdo_pgsql php7-pgsql php7-posix php7-mysqli php7-session php7-ctype && adduser -u 82 -D -S -G www-data www-data && \
  ln -sf /dev/stdout /var/log/nginx/access.log && ln -sf /dev/stderr /var/log/nginx/error.log && \
	apk del --quiet --no-cache --purge && rm -rf /var/cache/apk/*

COPY resources/ /

#VOLUME /data/web

EXPOSE 80/tcp

RUN set -xe && chmod +x /usr/bin/composer
