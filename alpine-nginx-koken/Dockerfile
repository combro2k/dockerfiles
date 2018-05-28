FROM combro2k/alpine-nginx-php5:latest

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

RUN set -xe && apk --quiet --no-cache add --virtual=run-deps php5-iconv php5-zlib php5-imap php5-openssl && rm /data/web -fr && mkdir /koken && \
	cd /data && curl -L https://s3.amazonaws.com/koken-installer/releases/Koken_Installer.zip --output /tmp/temp.zip && \
	unzip -q /tmp/temp.zip && mv /data/koken /data/web && chown www-data:www-data /data/web -R && rm -fr /data/web/data && rm /tmp/temp.zip && \
	apk del --quiet --no-cache --purge && rm -rf /var/cache/apk/*

VOLUME /data/web/storage
