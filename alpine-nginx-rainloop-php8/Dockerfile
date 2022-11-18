FROM combro2k/alpine-nginx:php8

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

RUN set -xe && apk --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/ add --virtual=run-deps curl php8-iconv php8-zlib php8-imap php8-openssl php8-pdo_sqlite php8-pdo_mysql php8-sqlite3 sqlite-libs && \
	rm /data/web -fr && mkdir /data/web /rainloop && cd /data/web && curl -L http://www.rainloop.net/repository/webmail/rainloop-latest.zip --output /tmp/temp.zip && \
	unzip -q /tmp/temp.zip && chown www-data:www-data /data/web -R && rm -fr /data/web/data && rm /tmp/temp.zip && apk del --quiet --no-cache --purge && \
	rm -rf /var/cache/apk/*

VOLUME /rainloop

COPY resources/ /
