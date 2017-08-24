FROM gliderlabs/alpine:edge

LABEL \
	org.label-schema.build-date=$BUILD_DATE \
	org.label-schema.vcs-ref=$VCS_REF \
	org.label-schema.vcs-url="https://github.com/combro2k/dockerfiles/"

ENV \
	FULL_NAME="aptly" \
	EMAIL_ADDRESS="aptly@aptly.container" \
	GPG_PASSWORD="aptly" \
	GPG_TTY="/dev/console" \
	GNUPGHOME="/aptly/.gnupg"

RUN apk --no-cache --progress add curl xz bzip2 gnupg1 debian-archive-keyring nginx su-exec && \
	mkdir -p /app/aptly && \
	curl -L https://bintray.com/artifact/download/smira/aptly/aptly_1.0.1_linux_amd64.tar.gz | tar zx -C /app/aptly --strip-components=1 && \
	adduser -D -h /aptly -u 1000 aptly && chown aptly:aptly /app/aptly -R && \
	curl -L -s https://github.com/just-containers/s6-overlay/releases/download/v1.20.0.0/s6-overlay-amd64.tar.gz | tar zx -C /

COPY resources/ /

RUN set -xe && apk del --quiet --no-cache --progress --purge && rm -rf /var/cache/apk/*

EXPOSE 80/tcp \
	8080/tcp

VOLUME 	/aptly

ENTRYPOINT ["/init"]
