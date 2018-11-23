FROM combro2k/alpine-base:latest

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

RUN \
      apk --no-cache --virtual=.run-deps add bash curl jq sysfsutils lm_sensors libcrypto1.1 http-parser libssl1.1 libuv nodejs mariadb-common  netcat-openbsd \
        mariadb-client py-mysqldb py-psycopg2 py-egenix-mx-base db libsasl libldap libpq py2-psycopg2 py-requests py-yaml python libuuid fping && \
      apk --no-cache --virtual=.build-deps add alpine-sdk autoconf automake gcc git libmnl-dev make pkgconfig util-linux-dev zlib-dev && \
      mkdir /usr/src && curl -L -Ss https://github.com/netdata/netdata/releases/download/v1.11.1/netdata-v1.11.1.tar.gz | tar zx -C /usr/src --strip-components=1 && \
      cd /usr/src/ && ./netdata-installer.sh --dont-wait --dont-start-it && cd /root && rm -fr /usr/src && \
      apk --no-cache --purge del .build-deps && apk del --no-cache --purge && rm -rf /var/cache/apk/* && \
      ln -sf /dev/stdout /var/log/netdata/access.log && ln -sf /dev/stdout /var/log/netdata/debug.log && ln -sf /dev/stderr /var/log/netdata/error.log

COPY resources/ /

EXPOSE 19999/tcp
