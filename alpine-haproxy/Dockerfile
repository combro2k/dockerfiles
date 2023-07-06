FROM combro2k/alpine-base:latest

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

ENV S6_KILL_GRACETIME=3000 DOCKER_ENDPOINT=unix:///tmp/docker.sock
ENV DOCKER_GEN_VERSION=0.10.4

RUN set -xe && \
	apk add --quiet --no-cache --virtual=run-deps curl ca-certificates openssl haproxy && mkdir /app && \
  mkdir -p /data/acme-challenge && chown -R haproxy:haproxy /data/acme-challenge && chmod +rwx /data/acme-challenge && \
	curl --location --silent https://github.com/nginx-proxy/docker-gen/releases/download/${DOCKER_GEN_VERSION}/docker-gen-alpine-linux-amd64-${DOCKER_GEN_VERSION}.tar.gz | tar zx -C /app && \
	apk del --quiet --no-cache --purge && rm -rf /var/cache/apk/*

COPY resources/ /

RUN chmod +x /app/reload-haproxy.sh /usr/bin/certbot /app/update-cf-list.sh

#VOLUME /tmp/docker.sock

EXPOSE 80/tcp 443/tcp 9000/tcp

ENTRYPOINT ["/init"]
