FROM combro2k/alpine-base:latest

LABEL \
        org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url="https://github.com/combro2k/dockerfiles/"

RUN \
	apk --quiet --no-cache add nodejs nodejs-npm curl tar && \
	mkdir -p /app/weecloud && curl -L https://github.com/eirikb/weecloud/archive/master.tar.gz | tar zx -C /app/weecloud --strip-components=1 && \
	cd /app/weecloud && npm install && \
	apk del --quiet --no-cache --progress --purge && rm -rf /var/cache/apk/*

COPY resources/ /

EXPOSE 3000/tcp
