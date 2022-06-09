FROM combro2k/alpine-base:latest

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

ENV SPIDERFOOT_VERSION 4.0

RUN set -xe && apk add --quiet --no-cache --virtual=.run-deps py3-pip py3-wheel curl tar libxml2 xmlsec libxslt tinyxml python3 openssl su-exec openjpeg libjpeg && \
	    apk add --quiet --no-cache --virtual=.build-deps alpine-sdk openssl-dev python3-dev libxml2-dev xmlsec-dev swig jpeg-dev openjpeg-dev zlib-dev \
        tinyxml-dev python3-dev musl-dev openssl-dev libffi-dev libxslt-dev rust cargo && \
      addgroup -g 1000 -S spiderfoot && adduser -S -u 1000 -h /app -s /usr/sbin/nologin -D spiderfoot -G spiderfoot && \
	    curl -L https://github.com/smicallef/spiderfoot/archive/v${SPIDERFOOT_VERSION}.tar.gz | tar zx -C /app --strip-components=1 && \
	    cd /app && pip3 --no-cache-dir install wheel cryptography && pip3 --no-cache-dir install -r /app/requirements.txt && chown -R spiderfoot:spiderfoot /app && \
	    apk del --quiet --no-cache --purge .build-deps && apk del --quiet --no-cache --purge && rm -rf /var/cache/apk/* && \
      apk --no-cache --quiet fix openssl

COPY resources/ /

EXPOSE 5001/tcp

VOLUME /data
