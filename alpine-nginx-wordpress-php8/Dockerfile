FROM combro2k/alpine-nginx:php8

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

RUN set -xe && apk --quiet --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/ add php8-fpm php8-json php8-zlib php8-xml php8-pdo php8-phar php8-openssl \
  php8-pdo_mysql php8-mysqli php8-gd php8-exif php8-fileinfo php8-mbstring php8-pecl-imagick php8-zip \
  php8-iconv php8-pecl-mcrypt && rm /data/web -fr && mkdir /data/web /wordpress && curl --location https://wordpress.org/latest.tar.gz | \
  tar zx -C /data/web --strip-components=1 && apk del --quiet --no-cache --purge && rm -rf /var/cache/apk/*

VOLUME /wordpress

COPY resources/ /
