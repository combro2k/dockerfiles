FROM combro2k/alpine-nginx-php7:latest

RUN \
	apk --no-cache add php7-fpm php7-json php7-zlib php7-xml php7-pdo php7-phar php7-openssl php7-pdo_mysql php7-mysqli php7-gd php7-iconv php7-mcrypt && \
	rm /data/web -fr && mkdir /data/web /wordpress && \
	curl --location https://wordpress.org/latest.tar.gz | tar zx -C /data/web --strip-components=1 

VOLUME /wordpress

COPY resources/etc /etc/

RUN set -xe && apk del --no-cache --progress --purge && rm -rf /var/cache/apk/*
