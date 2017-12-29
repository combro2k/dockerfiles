FROM combro2k/alpine-base:latest

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

RUN set -xe && \
      apk add --quiet --no-cache --virtual=.run-deps ruby curl ruby-irb ruby-etc ruby-webrick && \
      apk add --quiet --no-cache --virtual=.build-deps git openssl ruby-dev alpine-sdk && \
      mkdir /app /var/run/fluent /var/log/fluent -p && gem install fluentd -v "~> 0.12.0" --no-ri --no-rdoc && \
      adduser -D -S -u 1000 -h /fluent fluent && apk del --quiet --no-cache --purge .build-deps && apk del --quiet --no-cache --purge && rm -rf /var/cache/apk/*

COPY resources/ /

VOLUME /fluent /var/log/fluent

EXPOSE 24220/tcp 24224/tcp
