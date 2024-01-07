FROM combro2k/alpine-nginx:php8

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

RUN set -xe && apk --quiet --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/ add --virtual=run-deps php83-iconv php83-zlib php83-imap php83-openssl php83-pdo_sqlite php83-pdo_mysql php83-ctype && \
	rm /data/web -fr && mkdir /data/web /matomo && cd /data/web && curl --silent --location https://builds.matomo.org/matomo-latest.tar.gz | \
  tar zxv -C /data/web --strip-components=1 && cd /data/web && chown www-data:www-data /data/web && \
  apk del --quiet --no-cache --purge && rm -rf /var/cache/apk/*

VOLUME /matomo

COPY resources/ /
