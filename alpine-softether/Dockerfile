FROM frolvlad/alpine-glibc:latest

LABEL \
        org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url="https://github.com/combro2k/dockerfiles/"

ADD https://github.com/just-containers/s6-overlay/releases/download/v1.20.0.0/s6-overlay-amd64.tar.gz /

RUN apk --no-cache upgrade && apk --no-cache add openssl readline ncurses curl && apk --no-cache -t build-deps add readline-dev openssl-dev ncurses-dev build-base && \
	mkdir /tmp/softether && curl -L https://github.com/SoftEtherVPN/SoftEtherVPN/archive/master.tar.gz | tar zvx -C /tmp/softether --strip-components=1 && \
	cd /tmp/softether && ./configure && make && make install && rm -fr /tmp/softether && \
	apk del --quiet --no-cache --progress -t build-deps && apk del --quiet --no-cache --progress --purge && rm -rf /var/cache/apk/*

COPY resources/ /

RUN set -xe && 
EXPOSE 	41421/udp \
	443/tcp \
	992/tcp \
	1194/tcp \
	1194/udp \
	5555/tcp \
	27088/udp \
	52651/udp

VOLUME /data

ENTRYPOINT ["/init"]
