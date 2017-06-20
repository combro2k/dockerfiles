FROM gliderlabs/alpine

ENV \
	HOME=/data/api \
	RAILS_ENV=production \
	RACK_ENV=production

RUN set -xe && apk update && apk upgrade && \
	apk add --no-cache --virtual=run-deps \
		ca-certificates curl tar ruby ruby-bundler mariadb-libs ruby-bigdecimal ruby-rake \
		libaio json-c jsoncpp mariadb-client-libs mariadb-common mariadb-client bash && \
	apk add --no-cache -t build-deps \
		ruby-dev mysql-dev json-c-dev jsoncpp-dev make gcc musl-dev mariadb-client && \
	curl -L -s https://github.com/just-containers/s6-overlay/releases/download/v1.19.1.1/s6-overlay-amd64.tar.gz | tar zx -C /

RUN mkdir -p /data/api && curl --location https://github.com/posty/posty_api/archive/master.tar.gz | \
	    tar zx -C /data/api --strip-components=1 && \
	cd /data/api && bundle update json && bundle install --path /data/api/vendor --with mysql

COPY resources/etc /etc/
COPY resources/data /data/

RUN set -xe && apk del --progress --purge -t build-deps  && apk del --progress --purge && rm -rf /var/cache/apk/*

WORKDIR /data/api
EXPOSE 9292

ENTRYPOINT ["/init"]
