FROM combro2k/alpine-nginx:php8

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

ENV \
  NC_VERSION="22.1.1" \
  DB_TYPE="sqlite3" \
  DB_NAME="nextcloud" \
  DB_USER="nextcloud" \
  DB_PASSWORD="password" \
  DB_HOST="nextcloud-db" \
  DB_PREFIX="oc_"

RUN set -xe && apk add --quiet --no-cache --virtual=.build-dependencies autoconf automake file g++ gcc make php8-dev re2c zlib-dev && \
	apk add --quiet --no-cache curl ffmpeg libxml2 php8-pecl-apcu php8-bz2 php8-ctype php8-curl php8-dom php8-exif php8-ftp php8-gd \
		php8-gmp php8-iconv php8-imap php8-intl php8-ldap php8-mbstring php8-pecl-mcrypt php8-pecl-memcached php8-opcache php8-pcntl php8-pecl-imagick \
		php8-pdo_mysql php8-pdo_pgsql php8-pdo_sqlite php8-pgsql php8-posix php8-sqlite3 php8-xml php8-xmlreader php8-zip php8-fileinfo php8-bcmath \
		sudo tar unzip php8-xmlwriter php8-simplexml php8-openssl openssl su-exec findutils && \
	curl -L https://download.nextcloud.com/server/releases/nextcloud-${NC_VERSION}.tar.bz2 | tar jx -C /data/web --strip-components=1 && \
  chown -R www-data:www-data /data/web && mkdir -p /nextcloud/data && mv /data/web/config /nextcloud/config && \
  ln -s /nextcloud/data /data/web/data && ln -s /nextcloud/config /data/web/config && ln -s /nextcloud/apps /data/web/apps2 && \
	sed -i 's/;always_populate_raw_post_data = -1/always_populate_raw_post_data = -1/g' /etc/php8/php.ini && \
	echo "env[PATH] = /usr/local/bin:/usr/bin:/bin" >> /etc/php8/php-fpm.conf && \
	apk del --no-cache --purge .build-dependencies && apk del --quiet --no-cache --purge && rm -rf /var/cache/apk/*

COPY resources/ /

VOLUME /nextcloud
