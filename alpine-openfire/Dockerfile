FROM gliderlabs/alpine:edge

RUN apk --no-cache --progress add curl openjdk8-jre-base && \
	mkdir -p /app && \
	curl -L https://www.igniterealtime.org/downloadServlet?filename=openfire/openfire_4_1_5.tar.gz | tar zx -C /app && \
	curl -L -s https://github.com/just-containers/s6-overlay/releases/download/v1.19.1.1/s6-overlay-amd64.tar.gz | tar zx -C /

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

VOLUME 	/openfire/embedded-db \
	/openfire/conf

ENTRYPOINT ["/init"]
