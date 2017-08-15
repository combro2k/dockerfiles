FROM gliderlabs/alpine:edge

RUN set -xe && \
	    apk --quiet --no-cache upgrade && \
	    apk add --quiet --no-cache --virtual=run-deps py2-pip curl tar libxml2 xmlsec python2 openssl && \
	    apk add --quiet --no-cache --virtual=build-deps alpine-sdk openssl-dev python2-dev libxml2-dev xmlsec-dev swig && \
	    mkdir /app -p && curl -L https://github.com/smicallef/spiderfoot/archive/v2.11.0-final.tar.gz | tar zx -C /app --strip-components=1 && \
	    cd /app && pip install -r /app/requirements.txt && \
	    curl -L -s https://github.com/just-containers/s6-overlay/releases/download/v1.19.1.1/s6-overlay-amd64.tar.gz | tar zx -C /

COPY resources/ /

RUN set -xe && apk del --quiet --no-cache --progress --purge build-deps && apk del --quiet --no-cache --progress --purge && \
	    rm -rf /var/cache/apk/* && apk --no-cache --progress --quiet fix openssl

EXPOSE 5001/tcp

VOLUME /data

ENTRYPOINT ["/init"]
