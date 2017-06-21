FROM combro2k/alpine-nginx-php5:latest

RUN set -xe && apk --no-cache upgrade && apk --no-cache add --virtual=run-deps \
	php5-iconv php5-zlib php5-openssl php5-ctype php5-xml php5-pdo_mysql php5-pdo php5-pdo_sqlite php5-zip && \
	curl -L https://github.com/FreshRSS/FreshRSS/archive/master.tar.gz | tar zx -C /data/web --strip-components=1

COPY resources/etc /etc/

VOLUME /freshrss

RUN set -xe && apk del --nocache --progress --purge && rm -rf /var/cache/apk/*
