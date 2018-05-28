FROM combro2k/alpine-base:latest

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

RUN set -xe && apk add --quiet --no-cache --virtual=.run-deps py2-pip curl tar python2 openssl py-virtualenv libstdc++ && \
	    apk add --quiet --no-cache --virtual=.build-deps alpine-sdk openssl-dev python2-dev && \
      addgroup -g 1000 -S syncserver && adduser -S -u 1000 -h /app -s /usr/sbin/nologin -D syncserver -G syncserver && \
	    curl -L https://github.com/mozilla-services/syncserver/archive/master.tar.gz | tar zx -C /app --strip-components=1 && \
	    cd /app && make build && chown -R syncserver:syncserver /app && \
	    apk del --quiet --no-cache --purge .build-deps && apk del --quiet --no-cache --purge && rm -rf /var/cache/apk/* && \
      apk --no-cache --quiet fix openssl

COPY resources/ /

EXPOSE 5000/tcp

VOLUME /data
