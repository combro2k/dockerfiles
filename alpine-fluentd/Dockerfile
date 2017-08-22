FROM gliderlabs/alpine:edge

RUN set -xe && \
	    apk --quiet --no-cache upgrade && \
	    apk add --quiet --no-cache --virtual=run-deps ruby curl ruby-irb && \
	    apk add --quiet --no-cache --virtual=build-deps git openssl ruby-dev alpine-sdk && \
	    mkdir /app /var/run/fluent -p && gem install fluentd -v "~> 0.12.0" --no-ri --no-rdoc && adduser -D -S -h /fluent fluent && \
	    curl -L -s https://github.com/just-containers/s6-overlay/releases/download/v1.20.0.0/s6-overlay-amd64.tar.gz | tar zx -C /

COPY resources/ /

RUN set -xe && apk del --quiet --no-cache --purge build-deps && apk del --quiet --no-cache --progress --purge && rm -rf /var/cache/apk/*

VOLUME /fluent

EXPOSE 24220/tcp 24224/tcp

ENTRYPOINT ["/init"]
