FROM combro2k/alpine-nginx-php5:latest

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

RUN set -xe && apk --quiet --no-cache add --virtual=run-deps php5-iconv php5-zlib php5-imap php5-openssl php5-pdo_sqlite php5-pdo_mysql php5-ctype && \
	rm /data/web -fr && mkdir /data/web /matomo && cd /data/web && curl --silent --location https://github.com/matomo-org/piwik/archive/3.2.1.tar.gz | \
  tar zxv -C /data/web --strip-components=1 && cd /data/web && chown www-data:www-data /data/web && \
  /usr/bin/composer install && apk del --quiet --no-cache --purge && rm -rf /var/cache/apk/*

VOLUME /matomo

COPY resources/ /
