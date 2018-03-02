#FROM combro2k/alpine-base:latest
FROM haproxy:alpine

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

ENV \
  S6_KILL_GRACETIME=3000 \
  DOCKER_ENDPOINT=unix:///tmp/docker.sock \
  LETSENCRYPT_BACKEND_IP=127.0.0.1 \
  LETSENCRYPT_BACKEND_PORT=8888

RUN set -xe && \
	apk add --quiet --no-cache --virtual=run-deps curl ca-certificates openssl && mkdir /app && \
  curl --location --silent https://github.com/just-containers/s6-overlay/releases/download/v1.21.4.0/s6-overlay-amd64.tar.gz | tar zx -C / && \
	curl --location --silent https://github.com/jwilder/docker-gen/releases/download/0.7.4/docker-gen-alpine-linux-amd64-0.7.4.tar.gz | tar zx -C /app && \
	apk del --quiet --no-cache --purge && rm -rf /var/cache/apk/*

COPY resources/ /

RUN chmod +x /app/reload-haproxy.sh /usr/bin/certbot

#VOLUME /tmp/docker.sock

EXPOSE 80/tcp 443/tcp 9000/tcp

ENTRYPOINT ["/init"]

CMD []
