FROM alpine:edge

RUN \
	apk --no-cache --progress add nodejs nodejs-npm tar curl bash inotify-tools openssl procps python2 openssh-server && \
	apk --no-cache --progress add -t build-deps automake autoconf m4 libtool pkgconfig openssl-dev linux-headers build-base python2-dev && \
	curl -L -s https://github.com/just-containers/s6-overlay/releases/download/v1.20.0.0/s6-overlay-amd64.tar.gz | tar zx -C / && \
	mkdir /tmp/watchman && curl -L https://github.com/facebook/watchman/archive/master.tar.gz | tar zx -C /tmp/watchman --strip-components=1 && \
	cd /tmp/watchman && ./autogen.sh && ./configure --prefix=/usr --enable-statedir=/var/run/watchman && make && make install && \
	rm -fr /tmp/watchman && mkdir /app && adduser nuclide -D && chown nuclide:nuclide /app && \
	curl -L https://github.com/facebook/nuclide/archive/master.tar.gz | tar zx -C /app/ --strip-components=1 && \
	cd /app && npm install && chown -R nuclide:nuclide /app && \
	ln -s /app/pkg/nuclide-server/nuclide-start-server /usr/bin/nuclide-start-server

COPY resources/etc/ /etc/

RUN set -xe && apk del --quiet --no-cache --progress --purge -t build-deps && apk del --quiet --no-cache --progress --purge && rm -rf /var/cache/apk/*

EXPOSE 22

ENTRYPOINT ["/init"]
