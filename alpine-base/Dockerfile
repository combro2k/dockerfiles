FROM alpine:edge

ARG BUILD_DATE=now
ARG VCS_REF=master
ARG VCS_URL=https://github.com/combro2k/dockerfiles
ARG DOCKERFILE=alpine-base/Dockerfile

ENV S6_KILL_GRACETIME=10000 S6_FIX_ATTRS_HIDDEN=1 S6_KILL_FINISH_MAXTIME=30000

ONBUILD ARG BUILD_DATE=now
ONBUILD ARG VCS_REF=master
ONBUILD ARG VCS_URL=https://github.com/combro2k/dockerfiles/tree/master/alpine-base
ONBUILD ARG DOCKERFILE=alpine-base/Dockerfile

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

RUN set -xe && apk upgrade --quiet --no-cache && \
  apk add --quiet --no-cache libc6-compat && \
  apk add --quiet --no-cache --virtual=.build-deps curl tar alpine-sdk && \
  apk add --quiet --no-cache --virtual=.term-deps rxvt-unicode-terminfo && \
  curl --location --silent https://github.com/noqcks/gucci/releases/download/1.2.2/gucci-v1.2.2-linux-amd64 --output /usr/bin/gucci && chmod +x /usr/bin/gucci && \
	curl --location --silent https://github.com/just-containers/s6-overlay/releases/download/v1.22.1.0/s6-overlay-amd64.tar.gz | tar zx -C / && \
	apk del --quiet --no-cache --purge .build-deps && apk del --quiet --no-cache --purge && rm -rf /var/cache/apk/*  

# ONBUILD RUN (apk --quiet --no-cache upgrade || true) && rm -fr /var/cache/apk/*

ENTRYPOINT ["/init"]
