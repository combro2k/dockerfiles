FROM combro2k/alpine-base:latest

LABEL \
        org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url="https://github.com/combro2k/dockerfiles/"

ENV \
	HOME=/data/api \
	RAILS_ENV=production \
	RACK_ENV=production

RUN set -xe && apk add --quiet --no-cache --virtual=.run-deps ca-certificates curl tar ruby ruby-bundler mariadb-libs ruby-bigdecimal ruby-rake \
		libaio json-c jsoncpp mariadb-client-libs mariadb-common mariadb-client bash && \
	apk add --quiet --no-cache --virtual=.build-deps ruby-dev mysql-dev json-c-dev jsoncpp-dev make gcc musl-dev mariadb-client && \
	mkdir -p /data/api && curl --location https://github.com/posty/posty_api/archive/master.tar.gz | tar zx -C /data/api --strip-components=1 && \
	cd /data/api && bundle update json && bundle install --path /data/api/vendor --with mysql && apk del --quiet --no-cache --purge .build-deps && \
	apk del --quiet --no-cache --purge && rm -rf /var/cache/apk/*

COPY resources/ /

WORKDIR /data/api

EXPOSE 9292/tcp
