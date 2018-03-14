FROM combro2k/alpine-base:latest

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

ENV SPIDERFOOT_VERSION 2.12.0

RUN set -xe && apk add --quiet --no-cache --virtual=.run-deps py2-pip curl tar libxml2 xmlsec python2 openssl su-exec && \
	    apk add --quiet --no-cache --virtual=.build-deps alpine-sdk openssl-dev python2-dev libxml2-dev xmlsec-dev swig && \
      addgroup -g 1000 -S spiderfoot && adduser -S -u 1000 -h /app -s /usr/sbin/nologin -D spiderfoot -G spiderfoot && \
	    curl -L https://github.com/smicallef/spiderfoot/archive/v${SPIDERFOOT_VERSION}-final.tar.gz | tar zx -C /app --strip-components=1 && \
	    cd /app && pip install --upgrade --no-cache-dir -r /app/requirements.txt && chown -R spiderfoot:spiderfoot /app && \
	    apk del --quiet --no-cache --purge .build-deps && apk del --quiet --no-cache --purge && rm -rf /var/cache/apk/* && \
      apk --no-cache --progress --quiet fix openssl

COPY resources/ /

EXPOSE 5001/tcp

VOLUME /data
