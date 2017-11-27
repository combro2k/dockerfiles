FROM combro2k/alpine-base:latest

LABEL \
        org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url="https://github.com/combro2k/dockerfiles/"

RUN \
	apk --quiet --no-cache --virtual=.run-deps add bash curl jq sysfsutils lm_sensors libcrypto1.0 http-parser libssl1.0 libuv nodejs mariadb-common  netcat-openbsd \
		mariadb-client-libs py-mysqldb py-psycopg2 py-egenix-mx-base db libsasl libldap libpq py2-psycopg2 py-requests py-yaml python libuuid fping && \
	apk --quiet --no-cache --virtual=.build-deps add alpine-sdk autoconf automake gcc git libmnl-dev make pkgconfig util-linux-dev zlib-dev && \
	mkdir /usr/src && curl -L -Ss https://github.com/firehol/netdata/archive/master.tar.gz | tar zx -C /usr/src --strip-components=1 && \
	cd /usr/src/ && ./netdata-installer.sh --dont-wait --dont-start-it && cd /root && rm -fr /usr/src && \
	apk --quiet --no-cache --purge del .build-deps && apk del --quiet --no-cache --progress --purge && rm -rf /var/cache/apk/*

COPY resources/ /

EXPOSE 19999/tcp
