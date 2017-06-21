FROM combro2k/alpine-nginx-php5:latest

RUN set -xe && apk update && apk upgrade && \
	apk --no-cache add --virtual=run-deps php5-iconv php5-zlib php5-imap php5-openssl && \
	rm /data/web -fr && mkdir /data/web /rainloop && cd /data/web && \
	curl -L http://www.rainloop.net/repository/webmail/rainloop-latest.zip --output /tmp/temp.zip && \
	unzip -q /tmp/temp.zip && chown www-data:www-data /data/web -R && rm -fr /data/web/data && rm /tmp/temp.zip

VOLUME /rainloop

COPY resources/etc /etc/

RUN set -xe && apk del --progress --purge && rm -rf /var/cache/apk/*
