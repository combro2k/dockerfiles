FROM combro2k/alpine-nginx-php5:latest

RUN set -xe && apk --quiet --no-cache add --virtual=run-deps php5-iconv php5-zlib php5-openssl php5-ctype php5-xml php5-pdo_mysql php5-pdo php5-pdo_sqlite php5-zip && \
	curl -L https://github.com/FreshRSS/FreshRSS/archive/master.tar.gz | tar zx -C /data/web --strip-components=1 && \
	apk del --no-cache --progress --purge && rm -rf /var/cache/apk/*

COPY resources/ /

VOLUME /freshrss
