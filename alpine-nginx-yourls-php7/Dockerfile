FROM combro2k/alpine-nginx-php7:latest

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

ENV version=master \
 YOURLS_DB_USER="yourls" \
 YOURLS_DB_PASS="yourls" \
 YOURLS_DB_NAME="yourls" \
 YOURLS_DB_HOST="localhost" \
 YOURLS_DB_PREFIX="yourls_" \
 YOURLS_SITE="http://yourls.org" \
 YOURLS_HOURS_OFFSET="0" \
 YOURLS_LANG="" \
 YOURLS_ADMIN_USER="admin" \
 YOURLS_ADMIN_PASSWD="pass" \
 YOURLS_COOKIEKEY="modify this text with something random" \
 YOURLS_URL_CONVERT="62"

RUN set -xe && apk --quiet --no-cache add --virtual=run-deps php7-iconv php7-zlib php7-openssl php7-pdo_mysql && \
	rm /data/web -fr && mkdir /data/web && curl -L https://github.com/YOURLS/YOURLS/archive/master.tar.gz | tar zx -C /data/web --strip-components=1 && \
  chown www-data:www-data -R /data/web && apk del --no-cache --purge && rm -rf /var/cache/apk/*

COPY resources/ /

VOLUME /yourls
