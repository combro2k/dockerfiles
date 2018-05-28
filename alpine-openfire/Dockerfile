FROM combro2k/alpine-base:latest

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

RUN apk --no-cache add curl openjdk8-jre-base tar && \
	mkdir /app && curl --location --silent https://www.igniterealtime.org/downloadServlet?filename=openfire/openfire_4_1_5.tar.gz | tar zx -C /app && \
	apk del --quiet --no-cache --purge && rm -rf /var/cache/apk/*

COPY resources/ /

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
