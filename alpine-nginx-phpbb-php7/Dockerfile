FROM combro2k/alpine-nginx:php7

ENV \
      PHPBB_MAINLINE=3.3 \
      PHPBB_VERSION=3.3.10

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

RUN set -xe && apk --quiet --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/ \
    add --virtual=run-deps su-exec php7-iconv php7-zlib php7-openssl php7-ctype php7-xml php7-pdo_mysql \
		php7-pdo php7-pdo_sqlite php7-zip php7-tokenizer &&	mkdir /phpbb && chown www-data:www-data /phpbb -R && \
	curl -L https://download.phpbb.com/pub/release/${PHPBB_MAINLINE}/${PHPBB_VERSION}/phpBB-${PHPBB_VERSION}.tar.bz2 | tar jx -C /data/web --strip-components=1 && \
	chown www-data:www-data /data/web -R && \
	apk del --no-cache --purge && rm -rf /var/cache/apk/*

COPY resources/ /

VOLUME /phpbb
