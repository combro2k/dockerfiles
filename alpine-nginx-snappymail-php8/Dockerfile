FROM combro2k/alpine-nginx:php8

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

ENV SNAPPYMAIL_VERSION="2.14.3"

RUN set -xe && apk --no-cache add --virtual=run-deps curl php8-iconv php8-zlib php8-imap php8-openssl php8-pdo_sqlite php8-pdo_mysql php8-sqlite3 sqlite-libs php8-mbstring && \
	rm /data/web -fr && mkdir /data/web /snappymail && cd /data/web && curl -L https://github.com/the-djmaze/snappymail/releases/download/v${SNAPPYMAIL_VERSION}/snappymail-${SNAPPYMAIL_VERSION}.tar.gz | tar zx -C /data/web && \
	chown www-data:www-data /data/web -R && rm -fr /data/web/data && apk del --quiet --no-cache --purge && \
	rm -rf /var/cache/apk/*

VOLUME /rainloop

COPY resources/ /
