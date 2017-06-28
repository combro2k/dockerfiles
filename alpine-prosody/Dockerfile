FROM alpine:edge

RUN apk --no-cache --progress add curl prosody && \
	sed -i 's#^daemonize = true$#daemonize = false#g' /etc/prosody/prosody.cfg.lua && \
	curl -L -s https://github.com/just-containers/s6-overlay/releases/download/v1.19.1.1/s6-overlay-amd64.tar.gz | tar zx -C /

COPY resources/etc/ /etc/

RUN set -xe && apk del --quiet --no-cache --progress --purge && rm -rf /var/cache/apk/*


ENTRYPOINT ["/init"]
