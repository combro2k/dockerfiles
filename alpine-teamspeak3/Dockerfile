FROM frolvlad/alpine-glibc:latest

RUN set -xe && apk --no-cache upgrade && apk add curl && mkdir /app -p && \
	curl -L -s http://dl.4players.de/ts/releases/3.0.13.6/teamspeak3-server_linux_amd64-3.0.13.6.tar.bz2 | tar xj -C /app --strip-components=1 && \
	mkdir /teamspeak3 && touch /teamspeak3/ts3server.ini /teamspeak3/ts3server.sqlitedb && \
	ln -s /teamspeak3/ts3server.ini /app/ts3server.ini && ln -s /teamspeak3/ts3server.sqlitedb /app/ts3server.sqlitedb && \
	curl -L -s https://github.com/just-containers/s6-overlay/releases/download/v1.19.1.1/s6-overlay-amd64.tar.gz | tar zx -C /

COPY resources/etc /etc/

VOLUME ['/teamspeak3']

RUN set -xe && apk del --no-cache --progress --purge && rm -rf /var/cache/apk/* 

EXPOSE 9987/udp 10011/tcp 30033/tcp

ENTRYPOINT ["/init"]
