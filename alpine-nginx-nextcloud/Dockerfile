FROM combro2k/alpine-nginx:php8

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

ENV \
  DB_TYPE="sqlite3" \
  DB_NAME="nextcloud" \
  DB_USER="nextcloud" \
  DB_PASSWORD="password" \
  DB_HOST="nextcloud-db" \
  DB_PREFIX="oc_"

RUN set -xe && apk add --quiet --no-cache --virtual=.build-dependencies --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/ autoconf automake file g++ gcc make php83-dev re2c zlib-dev && \
	apk add --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/ --quiet --no-cache curl ffmpeg libxml2 php83-pecl-apcu php83-bz2 php83-ctype php83-curl php83-dom php83-exif php83-ftp php83-gd \
		php83-gmp php83-iconv php83-imap php83-intl php83-ldap php83-mbstring php83-pecl-mcrypt php83-pecl-memcached php83-opcache php83-pcntl php83-pecl-imagick \
		php83-pdo_mysql php83-pdo_pgsql php83-pdo_sqlite php83-pgsql php83-posix php83-sqlite3 php83-xml php83-xmlreader php83-zip php83-fileinfo php83-bcmath php83-sysvsem \
		sudo tar unzip php83-xmlwriter php83-simplexml php83-openssl openssl su-exec findutils && \
	curl -L https://download.nextcloud.com/server/releases/latest.tar.bz2 | tar jx -C /data/web --strip-components=1 && \
  chown -R www-data:www-data /data/web && mkdir -p /nextcloud/data && mv /data/web/config /nextcloud/config && \
  ln -s /nextcloud/data /data/web/data && ln -s /nextcloud/config /data/web/config && ln -s /nextcloud/apps /data/web/apps2 && \
	sed -i 's/;always_populate_raw_post_data = -1/always_populate_raw_post_data = -1/g' /etc/php83/php.ini && \
	echo "env[PATH] = /usr/local/bin:/usr/bin:/bin" >> /etc/php83/php-fpm.conf && \
	apk del --no-cache --purge .build-dependencies && apk del --quiet --no-cache --purge && rm -rf /var/cache/apk/*

COPY resources/ /

VOLUME /nextcloud
