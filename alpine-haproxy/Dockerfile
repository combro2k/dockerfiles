FROM combro2k/alpine-base:latest

LABEL \
        org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url="https://github.com/combro2k/dockerfiles/"

ENV DOCKER_ENDPOINT=unix:///tmp/docker.sock

ADD https://github.com/jwilder/docker-gen/releases/download/0.7.3/docker-gen-alpine-linux-amd64-0.7.3.tar.gz /app

RUN set -xe && apk --quiet --no-cache upgrade && apk add --quiet --no-cache --virtual=run-deps haproxy curl ca-certificates openssl

COPY resources/ /

#VOLUME /tmp/docker.sock

EXPOSE 80/tcp 443/tcp 9000/tcp

RUN set -xe && apk del --quiet --no-cache --progress --purge && rm -rf /var/cache/apk/* && chmod +x /app/reload-haproxy.sh

ENTRYPOINT ["/init"]
