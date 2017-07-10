FROM gliderlabs/alpine:edge

ENV FULL_NAME="aptly" \
	EMAIL_ADDRESS="aptly@aptly.container" \
	GPG_PASSWORD="aptly" \
	GPG_TTY="/dev/console" \
	GNUPGHOME="/aptly/.gnupg"

RUN apk --no-cache --progress add curl xz bzip2 gnupg debian-archive-keyring nginx && \
	mkdir -p /app/aptly && \
	curl -L https://bintray.com/artifact/download/smira/aptly/aptly_1.0.1_linux_amd64.tar.gz | tar zx -C /app/aptly --strip-components=1 && \
	ln -s /app/aptly/aptly /usr/bin/aptly && \
	curl -L -s https://github.com/just-containers/s6-overlay/releases/download/v1.19.1.1/s6-overlay-amd64.tar.gz | tar zx -C /

COPY resources/etc/ /etc/

RUN set -xe && apk del --quiet --no-cache --progress --purge && rm -rf /var/cache/apk/*

EXPOSE 80/tcp \
	8080/tcp

VOLUME 	/aptly

ENTRYPOINT ["/init"]
