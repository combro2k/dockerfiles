FROM combro2k/alpine-nginx-php7:latest

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

RUN set -xe && apk --quiet --no-cache add --virtual=run-deps php7-iconv php7-zlib php7-openssl php7-ctype php7-xml php7-pdo_mysql php7-pdo php7-pdo_sqlite php7-zip php7-fileinfo && \
	curl -L https://github.com/FreshRSS/FreshRSS/archive/master.tar.gz | tar zx -C /data/web --strip-components=1 && \
	apk del --no-cache --purge && rm -rf /var/cache/apk/* && \
  apk --quiet --no-cache add php7-ctype

COPY resources/ /

VOLUME /freshrss
