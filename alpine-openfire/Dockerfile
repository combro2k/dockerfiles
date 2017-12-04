FROM combro2k/alpine-base:latest

RUN apk --no-cache --progress add curl openjdk8-jre-base tar && \
	mkdir /app && curl --location --silent https://www.igniterealtime.org/downloadServlet?filename=openfire/openfire_4_1_5.tar.gz | tar zx -C /app && \
	apk del --quiet --no-cache --progress --purge && rm -rf /var/cache/apk/*

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
