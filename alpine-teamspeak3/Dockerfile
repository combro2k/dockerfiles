FROM combro2k/alpine-base:latest

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

ENV TS3SERVER_LICENSE=view \
    TS3_VERSION=3.10.2

RUN set -xe && apk --no-cache --quiet add curl libstdc++ && mkdir /app -p && \
  curl -L -s https://files.teamspeak-services.com/releases/server/${TS3_VERSION}/teamspeak3-server_linux_alpine-${TS3_VERSION}.tar.bz2 | tar xj -C /app --strip-components=1 && \
  adduser -D -h /teamspeak3 -u 1000 teamspeak3 && touch /teamspeak3/ts3server.ini /teamspeak3/ts3server.sqlitedb && \
  ln -s /teamspeak3/ts3server.ini /app/ts3server.ini && ln -s /teamspeak3/ts3server.sqlitedb /app/ts3server.sqlitedb && \
  mkdir /teamspeak3/files /teamspeak3/logs && ln -s /teamspeak3/files /app/files && ln -s /teamspeak3/logs /app/logs && \
  apk del --quiet --no-cache --purge && rm -rf /var/cache/apk/* 

COPY resources/ /

VOLUME /teamspeak3

EXPOSE 9987/udp 10011/tcp 30033/tcp

ENTRYPOINT ["/init"]
