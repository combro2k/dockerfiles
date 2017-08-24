FROM combro2k/alpine-base:latest

LABEL \
        org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url="https://github.com/combro2k/dockerfiles/"

RUN \
	apk --quiet --no-cache add \
		bash curl alpine-sdk autoconf automake curl gcc git libmnl-dev jq \
		sysfsutils lm_sensors libcrypto1.0 http-parser libssl1.0 libuv nodejs mariadb-common \
		mariadb-client-libs py-mysqldb py-psycopg2 py-egenix-mx-base db libsasl libldap libpq py2-psycopg2 \
		make netcat-openbsd pkgconfig py-requests py-yaml python util-linux-dev zlib-dev libuuid fping && \
	mkdir /usr/src && curl -L -Ss https://github.com/firehol/netdata/archive/master.tar.gz | tar zx -C /usr/src --strip-components=1 && \
	cd /usr/src/ && ./netdata-installer.sh --dont-wait --dont-start-it && cd /root && rm -fr /usr/src && \
	apk --quiet --no-cache --progress --purge del autoconf automake make pkgconfig alpine-sdk gcc git libmnl-dev util-linux-dev zlib-dev

COPY resources/ /

EXPOSE 19999/tcp

RUN set -xe && apk del --quiet --no-cache --progress --purge && rm -rf /var/cache/apk/*

ENTRYPOINT ["/init"]
