FROM combro2k/alpine-nginx-php7:latest

LABEL \
        org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url="https://github.com/combro2k/dockerfiles/"

RUN apk add --quiet --no-cache --virtual=.build-dependencies autoconf automake file g++ gcc make php7-dev re2c samba-dev zlib-dev && \
	apk add --quiet --no-cache curl ffmpeg libxml2 php7-apcu php7-bz2 php7-ctype php7-curl php7-dom php7-exif php7-ftp php7-gd \
		php7-gmp php7-iconv php7-imap php7-intl php7-ldap php7-mbstring php7-mcrypt php7-memcached php7-opcache php7-pcntl \
		php7-pdo_mysql php7-pdo_pgsql php7-pdo_sqlite php7-pgsql php7-posix php7-sqlite3 php7-xml php7-xmlreader php7-zip \
		samba sudo tar unzip && \
	curl -L https://download.nextcloud.com/server/releases/nextcloud-12.0.0.tar.bz2 | tar jx -C /data/web --strip-components=1 && \
	mkdir -p /tmp/smbclient && \
	curl -L https://github.com/eduardok/libsmbclient-php/archive/master.tar.gz | tar zx -C /tmp/smbclient --strip-components=1 && \
	cd /tmp/smbclient && phpize7 && ./configure --with-php-config=/usr/bin/php-config7 && make && make install && \
	echo "extension="smbclient.so"" > /etc/php7/conf.d/00_smbclient.ini && \
	sed -i 's/;always_populate_raw_post_data = -1/always_populate_raw_post_data = -1/g' /etc/php7/php.ini && \
	echo "env[PATH] = /usr/local/bin:/usr/bin:/bin" >> /etc/php7/php-fpm.conf && rm -Rf /tmp/smbclient && \
	apk del --no-cache --purge .build-dependencies && apk del --quiet --no-cache --purge && rm -rf /var/cache/apk/*

VOLUME /nextcloud /data/web
