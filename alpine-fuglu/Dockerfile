FROM combro2k/alpine-base:latest

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

RUN set -xe && apk add --quiet --no-cache --virtual=.run-deps clamav spamassassin p7zip unrar && \
  apk add --quiet --no-cache --virtual=.testing-run-deps --repository http://nl.alpinelinux.org/alpine/edge/testing \
    python3 py3-pip py3-magic py3-rarfile py3-beautifulsoup4 py3-sqlalchemy && apk add --quiet --no-cache --virtual=.build-deps python3-dev alpine-sdk && \
  addgroup -g 1000 -S vmail && adduser -S -u 1000 -h /var/vmail -s /usr/sbin/nologin -D vmail -G vmail && \
  /usr/bin/pip3 install fuglu pylzma && apk del --quiet --no-cache --purge .build-deps && apk del --quiet --no-cache --purge && rm -rf /var/cache/apk/*

COPY resources/ /

VOLUME /data
