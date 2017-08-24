FROM combro2k/alpine-base:latest

LABEL \
        org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url="https://github.com/combro2k/dockerfiles/"

RUN set -xe && apk add --quiet --no-cache --virtual=run-deps py2-pip curl tar libxml2 xmlsec python2 openssl && \
	    apk add --quiet --no-cache --virtual=build-deps alpine-sdk openssl-dev python2-dev libxml2-dev xmlsec-dev swig && \
	    mkdir /app -p && curl -L https://github.com/smicallef/spiderfoot/archive/v2.11.0-final.tar.gz | tar zx -C /app --strip-components=1 && \
	    cd /app && pip install -r /app/requirements.txt && apk del --quiet --no-cache --progress --purge build-deps && apk del --quiet --no-cache --progress --purge && \
	    rm -rf /var/cache/apk/* && apk --no-cache --progress --quiet fix openssl

COPY resources/ /

EXPOSE 5001/tcp

VOLUME /data
