FROM combro2k/alpine-nginx:php8

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

RUN set -xe && apk --quiet --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/ add php83-fpm php83-json php83-zlib php83-xml php83-pdo php83-phar php83-openssl \
  php83-pdo_mysql php83-mysqli php83-gd php83-exif php83-fileinfo php83-mbstring php83-pecl-imagick php83-zip \
  php83-iconv php83-pecl-mcrypt && rm /data/web -fr && mkdir /data/web /wordpress && curl --location https://wordpress.org/latest.tar.gz | \
  tar zx -C /data/web --strip-components=1 && apk del --quiet --no-cache --purge && rm -rf /var/cache/apk/*

VOLUME /wordpress

COPY resources/ /
