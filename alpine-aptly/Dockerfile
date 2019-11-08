FROM combro2k/alpine-base:latest

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

ENV \
	FULL_NAME="aptly" \
	EMAIL_ADDRESS="aptly@aptly.container" \
	GPG_PASSWORD="aptly" \
	GPG_TTY="/dev/console" \
	GNUPGHOME="/aptly/.gnupg" \
  APTLY_VERSION=1.4.0

RUN apk --no-cache add curl xz bzip2 gnupg1 debian-archive-keyring nginx su-exec && \
	mkdir -p /app/aptly && curl -L https://github.com/aptly-dev/aptly/releases/download/v${APTLY_VERSION}/aptly_${APTLY_VERSION}_linux_amd64.tar.gz | tar zx -C /app/aptly --strip-components=1 && \
	adduser -D -h /aptly -u 1000 aptly && chown aptly:aptly /app/aptly -R && apk del --quiet --no-cache --purge && rm -rf /var/cache/apk/*


COPY resources/ /

EXPOSE 80/tcp 8080/tcp

VOLUME 	/aptly
