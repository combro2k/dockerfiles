FROM combro2k/alpine-nginx-php7:latest

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

RUN set -xe && apk --quiet --no-cache add php7-fpm php7-json php7-zlib php7-xml php7-pdo php7-phar php7-openssl php7-pdo_mysql php7-mysqli php7-gd \
  php7-iconv php7-mcrypt && rm /data/web -fr && mkdir /data/web /wordpress && curl --location https://wordpress.org/latest.tar.gz | \
  tar zx -C /data/web --strip-components=1 && apk del --quiet --no-cache --purge && rm -rf /var/cache/apk/*

VOLUME /wordpress

COPY resources/ /
