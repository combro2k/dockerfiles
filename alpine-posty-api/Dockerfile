FROM alpine:3.5
  
ARG BUILD_DATE=now
ARG VCS_REF=master
ARG VCS_URL=https://github.com/combro2k/dockerfiles
ARG DOCKERFILE=alpine-base/Dockerfile

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

ENV \
	HOME=/data/api \
	RAILS_ENV=production \
	RACK_ENV=production

RUN set -xe && apk add --quiet --no-cache --virtual=.run-deps ca-certificates curl tar ruby mariadb-libs ruby-bigdecimal ruby-rake \
		libaio json-c jsoncpp mariadb-client-libs mariadb-common mariadb-client bash && \
  curl --location --silent https://github.com/just-containers/s6-overlay/releases/download/v1.22.1.0/s6-overlay-amd64.tar.gz | tar zx -C / && \
	apk add --quiet --no-cache --virtual=.build-deps ruby-dev mysql-dev json-c-dev jsoncpp-dev make gcc musl-dev mariadb-client && \
	mkdir -p /data/api && curl --location https://github.com/posty/posty_api/archive/master.tar.gz | tar zx -C /data/api --strip-components=1 && \
	gem install bundler --no-ri --no-rdoc && adduser -h /var/vmail -D -H -u 1000 vmail && cd /data/api && bundle update json && \
  bundle install --path /data/api/vendor --with mysql && apk del --quiet --no-cache --purge .build-deps && apk del --quiet --no-cache --purge && \
  rm -rf /var/cache/apk/*

COPY resources/ /

WORKDIR /data/api

EXPOSE 9292/tcp

ENTRYPOINT ["/init"]

