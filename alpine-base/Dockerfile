FROM alpine:edge

ARG BUILD_DATE=now
ARG VCS_REF=master
ARG VCS_URL=https://github.com/combro2k/dockerfiles
ARG DOCKERFILE=alpine-base/Dockerfile
ARG S6_OVERLAY_VERSION=3.1.5.0
ARG GUCCI_VERSION=1.6.6

ENV S6_KILL_GRACETIME=10000 S6_FIX_ATTRS_HIDDEN=1 S6_KILL_FINISH_MAXTIME=300000 S6_CMD_WAIT_FOR_SERVICES_MAXTIME=3000000

ONBUILD ARG BUILD_DATE=now
ONBUILD ARG VCS_REF=master
ONBUILD ARG VCS_URL=https://github.com/combro2k/dockerfiles/tree/master/alpine-base
ONBUILD ARG DOCKERFILE=alpine-base/Dockerfile

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

RUN set -xe && \
  apk upgrade --quiet --no-cache && \
  apk add --quiet --no-cache libc6-compat && \
  apk add --quiet --no-cache --virtual=.build-deps curl tar xz alpine-sdk && \
  apk add --quiet --no-cache --virtual=.term-deps rxvt-unicode-terminfo shadow && \
  curl --location --silent https://github.com/noqcks/gucci/releases/download/${GUCCI_VERSION}/gucci-v${GUCCI_VERSION}-linux-amd64 --output /usr/bin/gucci && chmod +x /usr/bin/gucci && \
	curl --location --silent https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-noarch.tar.xz | tar -C / -Jxp && \
	curl --location --silent https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-x86_64.tar.xz | tar -C / -Jxp && \
	apk del --quiet --no-cache --purge .build-deps && apk del --quiet --no-cache --purge && rm -rf /var/cache/apk/*  

ONBUILD RUN (apk --quiet --no-cache upgrade || true) && rm -fr /var/cache/apk/*

COPY resources/ /

ENTRYPOINT ["/init"]
