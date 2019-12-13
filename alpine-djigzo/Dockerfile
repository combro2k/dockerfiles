FROM combro2k/alpine-base:latest

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

ENV \
  TOMCAT_VERSION=8.5.50 \
  DJIGZO_VERSION=4.5.0-0 \
	DJIGZO_MYSQL_DATABASE=djigzo \
	DJIGZO_MYSQL_USER=djigzo \
	DJIGZO_MYSQL_PASSWORD=djigzo \
	MYSQL_PORT_3306_TCP_ADDR=172.17.0.1 \
	MYSQL_PORT_3306_TCP_PORT=3306 \
	MAIL_CALLBACK_IP=172.17.0.1 \
	MAIL_CALLBACK_PORT=10026

RUN set -xe && apk add --no-cache --virtual=run-deps curl tar apache-ant openjdk8 bash openssl apr sudo coreutils && \
	apk add --no-cache openssl-dev alpine-sdk apr-dev && \
	mkdir -p /app/tomcat8 /tmp/tomcat-native && curl -L -s  http://ftp.tudelft.nl/apache/tomcat/tomcat-8/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz | \
	tar zx -C /app/tomcat8 --strip-components=1 && tar zx -C /tmp/tomcat-native -f /app/tomcat8/bin/tomcat-native.tar.gz --strip-components=1 && \
	cd /tmp/tomcat-native/native && ./configure --with-java-home=/usr/lib/jvm/default-jvm	--with-apr=/usr/bin/apr-1-config \
    --prefix=/app/tomcat8 --libdir=/usr/java/packages/lib/amd64 --with-ssl=yes && \
	make && make install && rm -fr /tmp/tomcat-native && rm -fr /app/tomcat8/webapps/* && mkdir -p /app/djigzo /app/djigzo-web && \
  curl --location --silent https://www.ciphermail.com/downloads/djigzo-release-${DJIGZO_VERSION}/djigzo_${DJIGZO_VERSION}.tar.gz | tar zvx -C /app/djigzo && \
 	curl --location --silent https://www.ciphermail.com/downloads/djigzo-release-${DJIGZO_VERSION}/djigzo-web_${DJIGZO_VERSION}.tar.gz | tar zvx -C /app/djigzo-web && \
	cd /app/djigzo && find /app/djigzo/conf -type f -exec dos2unix {} \; && /usr/bin/ant && chmod +x /app/djigzo/start-djigzo.sh && chmod +x /app/djigzo/scripts/*.sh && \
	apk del --quiet --no-cache openssl-dev alpine-sdk apr-dev && apk del --quiet --no-cache --purge && rm -rf /var/cache/apk/* && apk --no-cache --quiet fix openssl

COPY resources/ /

EXPOSE 8443 8080 10025

ENTRYPOINT ["/init"]
