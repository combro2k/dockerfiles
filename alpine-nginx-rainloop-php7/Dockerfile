FROM combro2k/alpine-nginx-php7:latest

LABEL \
        org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url="https://github.com/combro2k/dockerfiles/"

RUN set -xe && apk --quiet --no-cache upgrade && apk --no-cache add --virtual=run-deps php7-iconv php7-zlib php7-imap php7-openssl && \
	rm /data/web -fr && mkdir /data/web /rainloop && cd /data/web && \
	curl -L http://www.rainloop.net/repository/webmail/rainloop-latest.zip --output /tmp/temp.zip && \
	unzip -q /tmp/temp.zip && chown www-data:www-data /data/web -R && rm -fr /data/web/data && rm /tmp/temp.zip

VOLUME /rainloop

COPY resources/etc /etc/

RUN set -xe && apk del --quiet --no-cache --progress --purge && rm -rf /var/cache/apk/*
