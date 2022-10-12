FROM combro2k/alpine-base:latest

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

ENV UID="1000" \
    GID="1000" \
    GRIMD_VERSION="1.1.4"

ADD https://github.com/looterz/grimd/releases/download/v${GRIMD_VERSION}/grimd_${GRIMD_VERSION}_linux_amd64.tar.gz /tmp/grimd.tgz

RUN apk add --no-cache libcap ca-certificates su-exec && \
  tar -C /usr/local/bin -zxf /tmp/grimd.tgz grimd && rm /tmp/grimd.tgz && \
  setcap cap_net_bind_service=+eip /usr/local/bin/grimd && \
  adduser -D -h /config -u $UID -g $GID grimd && apk del libcap

COPY resources/ /

VOLUME /config

EXPOSE 53/udp 53/tcp 8080/tcp
