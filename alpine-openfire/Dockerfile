FROM combro2k/alpine-base:latest

LABEL \
        org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url="https://github.com/combro2k/dockerfiles/"

ADD https://www.igniterealtime.org/downloadServlet?filename=openfire/openfire_4_1_5.tar.gz /app

RUN apk --no-cache --progress add curl openjdk8-jre-base

COPY resources/etc/ /etc/

RUN set -xe && apk del --quiet --no-cache --progress --purge && rm -rf /var/cache/apk/*

EXPOSE 	5222/tcp \
	5223/tcp \
	5229/tcp \
	5262/tcp \
	5263/tcp \
	5269/tcp \
	5275/tcp \
	5276/tcp \
	7070/tcp \
	7443/tcp \
	7777/tcp \
	9090/tcp \
	9091/tcp

VOLUME 	/openfire

ENTRYPOINT ["/init"]
