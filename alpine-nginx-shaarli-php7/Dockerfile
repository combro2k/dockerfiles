FROM combro2k/alpine-nginx-php7:latest

RUN set -xe && apk --quiet --no-cache add --virtual=run-deps php7-iconv php7-zlib php7-imap php7-openssl php7-simplexml php7-tokenizer php7-ctype && \
	cd /data && curl --location --silent https://github.com/shaarli/Shaarli/archive/latest.tar.gz | tar zx -C /data/web --strip-components=1 && \
	chown www-data:www-data /data/web -R && cd /data/web && /usr/bin/composer install --no-dev && \
	apk del --quiet --no-cache --progress --purge && rm -rf /var/cache/apk/*

VOLUME /data/web/data
