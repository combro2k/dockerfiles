FROM combro2k/alpine-base:latest

LABEL \
        org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url="https://github.com/combro2k/dockerfiles/"

RUN set -xe && apk --quiet --no-cache upgrade && \
	apk add --quiet --no-cache --virtual=run-deps ca-certificates curl tar lighttpd lighttpd-mod_auth apache2-utils pwgen && \
	mkdir -p /data/webui && curl --location https://github.com/posty/posty_webui/archive/master.tar.gz | tar zx -C /data/webui --strip-components=1 && \
	apk del --quiet --no-cache --progress --purge && rm -rf /var/cache/apk/*

COPY resources/ /

VOLUME /data/config

EXPOSE 80/tcp
