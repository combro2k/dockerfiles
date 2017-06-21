FROM gliderlabs/alpine:edge

RUN \
	apk --no-cache add \
		bash curl alpine-sdk autoconf automake curl gcc git libmnl-dev jq \
		sysfsutils lm_sensors libcrypto1.0 http-parser libssl1.0 libuv nodejs mariadb-common \
		mariadb-client-libs py-mysqldb py-psycopg2 py-egenix-mx-base db libsasl libldap libpq py2-psycopg2 \
		make netcat-openbsd pkgconfig py-requests py-yaml python util-linux-dev zlib-dev libuuid fping && \
	mkdir /usr/src && curl -L -Ss https://github.com/firehol/netdata/archive/master.tar.gz | tar zx -C /usr/src --strip-components=1 && \
	cd /usr/src/ && ./netdata-installer.sh --dont-wait --dont-start-it && cd /root && rm -fr /usr/src && \
	apk --no-cache --progress --purge del autoconf automake make pkgconfig alpine-sdk gcc git libmnl-dev util-linux-dev zlib-dev && \
	curl -L -s https://github.com/just-containers/s6-overlay/releases/download/v1.19.1.1/s6-overlay-amd64.tar.gz | tar zx -C /

COPY resources/etc /etc/

EXPOSE 19999/tcp

RUN set -xe && apk del --no-cache --progress --purge && rm -rf /var/cache/apk/*

ENTRYPOINT ["/init"]
