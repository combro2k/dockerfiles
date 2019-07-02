FROM combro2k/alpine-nginx-php7:latest

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

RUN set -xe && apk --no-cache add --virtual=run-deps curl php7-iconv php7-zlib php7-imap php7-openssl php7-pdo_sqlite php7-pdo_mysql php7-sqlite3 sqlite-libs && \
	rm /data/web -fr && mkdir /data/web /rainloop && cd /data/web && curl -L http://www.rainloop.net/repository/webmail/rainloop-latest.zip --output /tmp/temp.zip && \
	unzip -q /tmp/temp.zip && chown www-data:www-data /data/web -R && rm -fr /data/web/data && rm /tmp/temp.zip && apk del --quiet --no-cache --purge && \
	rm -rf /var/cache/apk/*

VOLUME /rainloop

COPY resources/ /
