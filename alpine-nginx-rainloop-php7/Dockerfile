FROM combro2k/alpine-nginx-php7:latest

RUN set -xe && apk --no-cache upgrade && apk --no-cache add --virtual=run-deps php7-iconv php7-zlib php7-imap php7-openssl && \
	rm /data/web -fr && mkdir /data/web /rainloop && cd /data/web && \
	curl -L http://www.rainloop.net/repository/webmail/rainloop-latest.zip --output /tmp/temp.zip && \
	unzip -q /tmp/temp.zip && chown www-data:www-data /data/web -R && rm -fr /data/web/data && rm /tmp/temp.zip

VOLUME /rainloop

COPY resources/etc /etc/

RUN set -xe && apk del --no-cache --progress --purge && rm -rf /var/cache/apk/*

