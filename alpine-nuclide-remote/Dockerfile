FROM alpine:edge
#FROM frolvlad/alpine-glibc:latest

RUN apk --no-cache --progress add nodejs nodejs-npm tar curl bash inotify-tools openssl procps python2 && \
	apk --no-cache --progress add -t build-deps automake autoconf m4 libtool \
		pkgconfig openssl-dev linux-headers build-base python2-dev && \
	mkdir /app /tmp/watchman && \
	curl -L https://github.com/facebook/nuclide/archive/master.tar.gz | tar zx -C /app/ --strip-components=1 && \
	curl -L https://github.com/facebook/watchman/archive/master.tar.gz | tar zx -C /tmp/watchman --strip-components=1

RUN cd /app && \
	npm install && \
	cd /tmp/watchman && ./autogen.sh && \
	./configure --prefix=/usr --enable-statedir=/var/run/watchman && make && make install

RUN adduser nuclide -D

USER nuclide
