FROM combro2k/alpine-nginx-php7:latest

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

ENV \
  NC_VERSION="17.0.2" \
  DB_TYPE="sqlite3" \
  DB_NAME="nextcloud" \
  DB_USER="nextcloud" \
  DB_PASSWORD="password" \
  DB_HOST="nextcloud-db" \
  DB_PREFIX="oc_"

RUN set -xe && apk add --quiet --no-cache --virtual=.build-dependencies autoconf automake file g++ gcc make php7-dev re2c samba-dev zlib-dev && \
	apk add --quiet --no-cache curl ffmpeg libxml2 php7-apcu php7-bz2 php7-ctype php7-curl php7-dom php7-exif php7-ftp php7-gd \
		php7-gmp php7-iconv php7-imap php7-intl php7-ldap php7-mbstring php7-mcrypt php7-memcached php7-opcache php7-pcntl php7-pecl-imagick \
		php7-pdo_mysql php7-pdo_pgsql php7-pdo_sqlite php7-pgsql php7-posix php7-sqlite3 php7-xml php7-xmlreader php7-zip php7-fileinfo \
		samba sudo tar unzip php7-xmlwriter php7-simplexml su-exec findutils && \
	curl -L https://download.nextcloud.com/server/releases/nextcloud-${NC_VERSION}.tar.bz2 | tar jx -C /data/web --strip-components=1 && \
  chown -R www-data:www-data /data/web && mkdir -p /nextcloud/data && mv /data/web/config /nextcloud/config && \
  ln -s /nextcloud/data /data/web/data && ln -s /nextcloud/config /data/web/config && ln -s /nextcloud/apps /data/web/apps2 && \
	mkdir -p /tmp/smbclient && curl -L https://github.com/eduardok/libsmbclient-php/archive/master.tar.gz | \
    tar zx -C /tmp/smbclient --strip-components=1 && cd /tmp/smbclient && phpize7 && \
  ./configure --with-php-config=/usr/bin/php-config7 && make && make install && echo "extension="smbclient.so"" > /etc/php7/conf.d/00_smbclient.ini && \
	sed -i 's/;always_populate_raw_post_data = -1/always_populate_raw_post_data = -1/g' /etc/php7/php.ini && \
	echo "env[PATH] = /usr/local/bin:/usr/bin:/bin" >> /etc/php7/php-fpm.conf && rm -Rf /tmp/smbclient && \
	apk del --no-cache --purge .build-dependencies && apk del --quiet --no-cache --purge && rm -rf /var/cache/apk/*

COPY resources/ /

VOLUME /nextcloud
