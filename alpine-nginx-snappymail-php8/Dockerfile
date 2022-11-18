FROM combro2k/alpine-nginx:php8

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

RUN set -xe && apk --quiet --no-cache add --virtual=.build-deps php8-dev gpgme-dev make g++ gcc jq && \
  SNAPPYMAIL_VERSION=`curl --silent https://raw.githubusercontent.com/the-djmaze/snappymail/master/package.json | jq -r .version` && \
  apk --quiet --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/ add --virtual=run-deps \
    curl php8-iconv php8-zlib php8-imap php8-openssl php8-pdo_sqlite php8-pdo_mysql php8-pecl-uuid php8-tidy php8-sodium php8-zip php8-pecl-apcu php8-pecl-imagick \
    php8-phar php8-sqlite3 sqlite-libs php8-mbstring php8-pecl-apcu php8-intl gpgme && rm /data/web -fr && mkdir /data/web /snappymail && cd /data/web && \
  curl -L https://github.com/the-djmaze/snappymail/releases/download/v${SNAPPYMAIL_VERSION}/snappymail-${SNAPPYMAIL_VERSION}.tar.gz | tar zx -C /data/web && \
	chown www-data:www-data /data/web -R && rm -fr /data/web/data &&   git clone --recursive https://github.com/php-gnupg/php-gnupg.git /tmp/php-gnupg && \
  cd /tmp/php-gnupg && phpize8 && ./configure --with-php-config=/usr/bin/php-config8 && make && make install && rm -fr /tmp/php-gnupg && \
	apk del --quiet --no-cache --purge .build-deps && apk del --quiet --no-cache --purge && \
  rm -rf /var/cache/apk/*

VOLUME /snappymail

COPY resources/ /
