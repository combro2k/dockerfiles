FROM combro2k/alpine-nginx-php7:latest

RUN set -xe && apk --quiet --no-cache upgrade && apk --quiet --no-cache add --virtual=run-deps \
	php7-iconv php7-zlib php7-openssl php7-ctype php7-xml php7-pdo_mysql php7-pdo php7-pdo_sqlite php7-zip php7-fileinfo && \
	curl -L https://github.com/FreshRSS/FreshRSS/archive/master.tar.gz | tar zx -C /data/web --strip-components=1

COPY resources/ /

VOLUME /freshrss

RUN set -xe && apk del --no-cache --progress --purge && rm -rf /var/cache/apk/*
