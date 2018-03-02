FROM combro2k/alpine-base-glibc:latest

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

RUN set -xe && apk --no-cache --quiet add curl && mkdir /app -p && \
	curl -L -s http://dl.4players.de/ts/releases/3.1.1/teamspeak3-server_linux_amd64-3.1.1.tar.bz2 | tar xj -C /app --strip-components=1 && \
	adduser -D -h /teamspeak3 -u 1000 teamspeak3 && touch /teamspeak3/ts3server.ini /teamspeak3/ts3server.sqlitedb && \
	ln -s /teamspeak3/ts3server.ini /app/ts3server.ini && ln -s /teamspeak3/ts3server.sqlitedb /app/ts3server.sqlitedb && \
	apk del --quiet --no-cache --purge && rm -rf /var/cache/apk/* 

COPY resources/ /

VOLUME /teamspeak3

EXPOSE 9987/udp 10011/tcp 30033/tcp

ENTRYPOINT ["/init"]
