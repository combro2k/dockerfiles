FROM alpine:edge

ARG BUILD_DATE=unknown
ARG VCS_REF=unknown

LABEL \
        org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url="https://github.com/combro2k/dockerfiles/"

RUN set -xe && (apk --quiet --no-cache upgrade || true) && apk add --quiet --no-cache curl tar && \
	curl --location --silent https://github.com/just-containers/s6-overlay/releases/download/v1.21.2.0/s6-overlay-amd64.tar.gz | tar zx -C / && \
	apk del --quiet --no-cache --purge curl tar && apk del --quiet --no-cache --purge && rm -rf /var/cache/apk/*

ONBUILD RUN (apk --quiet --no-cache upgrade || true) && rm -fr /var/cache/apk/*

ENTRYPOINT ["/init"]
