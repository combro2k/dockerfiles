FROM combro2k/alpine-base:latest

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

RUN set -xe && apk add --quiet --no-cache curl && \
	curl --silent --location https://raw.githubusercontent.com/andyshinn/alpine-pkg-glibc/master/sgerrand.rsa.pub --output /etc/apk/keys/sgerrand.rsa.pub && \
	curl --silent --location https://github.com/sgerrand/alpine-pkg-glibc/releases/download/unreleased/glibc-2.25-r1.apk --output /tmp/glibc.apk && \
	curl --silent --location https://github.com/sgerrand/alpine-pkg-glibc/releases/download/unreleased/glibc-bin-2.25-r1.apk --output /tmp/glibc-bin.apk && \
	curl --silent --location https://github.com/sgerrand/alpine-pkg-glibc/releases/download/unreleased/glibc-i18n-2.25-r1.apk --output /tmp/glibc-i18n.apk && \
        apk --quiet --no-cache add /tmp/glibc.apk /tmp/glibc-bin.apk /tmp/glibc-i18n.apk && rm /tmp/glibc.apk /tmp/glibc-bin.apk /tmp/glibc-i18n.apk && \
        /usr/glibc-compat/bin/localedef --force --inputfile POSIX --charmap UTF-8 C.UTF-8 || true && echo "export LANG=C.UTF-8" > /etc/profile.d/locale.sh && \
        apk del --quiet --no-cache --purge curl glibc-i18n && apk del --quiet --no-cache --purge && rm -rf /var/cache/apk/*
