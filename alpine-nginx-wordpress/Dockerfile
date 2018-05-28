FROM combro2k/alpine-nginx-php5:latest

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

RUN set -xe && apk --quiet --no-cache add php5-fpm php5-json php5-zlib php5-xml php5-pdo php5-phar php5-openssl php5-pdo_mysql php5-mysqli php5-gd \
  php5-iconv php5-mcrypt && rm /data/web -fr && mkdir /data/web /wordpress && curl --location https://wordpress.org/latest.tar.gz | \
  tar zx -C /data/web --strip-components=1 && apk del --quiet --no-cache --purge && rm -rf /var/cache/apk/*

VOLUME /wordpress

COPY resources/ /
