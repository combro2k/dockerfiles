FROM gliderlabs/alpine:edge

ARG BUILD_DATE=unknown
ARG VCS_REF=unknown

LABEL \
        org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url="https://github.com/combro2k/dockerfiles/"

ADD https://github.com/just-containers/s6-overlay/releases/download/v1.20.0.0/s6-overlay-amd64.tar.gz .

RUN set -xe && apk --quiet --no-cache --progress upgrade && apk del --quiet --no-cache --progress --purge && rm -rf /var/cache/apk/*

ENTRYPOINT ["/init"]
