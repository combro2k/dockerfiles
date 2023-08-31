FROM combro2k/alpine-nginx:php8.2

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

ENV ORGANIZR_BRANCH=v2-master

RUN set -xe && apk add --virtual=run-deps \
    curl php82-iconv php82-zlib php82-imap php82-openssl php82-pdo_sqlite php82-pdo_mysql php82-sqlite3 sqlite-libs \
    php82-zip php82 php82-simplexml && rm /data/web -fr && mkdir /config /data/web && cd /data/web && \
    curl -L https://github.com/causefx/Organizr/archive/refs/heads/v2-master.tar.gz | tar zx -C /data/web --strip-components=1 && \
    ln -s /config /data/web/data && chown -R www-data:www-data /data/web /config && apk del --quiet --no-cache --purge && \
	rm -rf /var/cache/apk/*

VOLUME /config