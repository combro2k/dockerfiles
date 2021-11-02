FROM golang:alpine3.14 as builder

RUN set -xe && go install github.com/looterz/grimd@latest

FROM combro2k/alpine-base:latest

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

ENV UID="1000" \
    GID="1000"

COPY --from=builder /go/bin/grimd /usr/local/bin/grimd

RUN apk add --no-cache libcap ca-certificates su-exec && \
  setcap cap_net_bind_service=+eip /usr/local/bin/grimd && \
  adduser -D -h /config -u $UID -g $GID grimd && apk del libcap

COPY resources/ /

VOLUME /config

EXPOSE 53/udp 53/tcp 8080/tcp
