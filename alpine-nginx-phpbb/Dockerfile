FROM combro2k/alpine-nginx:php5

ENV \
  PHPBB_MAINLINE=3.3 \
  PHPBB_VERSION=3.3.9

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

RUN set -xe && apk --quiet --no-cache add --virtual=run-deps su-exec php5-iconv php5-zlib php5-openssl php5-ctype php5-xml php5-pdo_mysql \
  php5-pdo php5-pdo_sqlite php5-zip && mkdir /phpbb && chown www-data:www-data /phpbb -R && \
	curl -k -L https://download.phpbb.com/pub/release/${PHPBB_MAINLINE}/${PHPBB_VERSION}/phpBB-${PHPBB_VERSION}.tar.bz2 | tar jx -C /data/web --strip-components=1 && \
	chown www-data:www-data /data/web -R && \
	apk del --no-cache --purge && rm -rf /var/cache/apk/*

COPY resources/ /

VOLUME /phpbb
