#!/usr/bin/env sh

export NGINX_VERSION=1.13.0
export NPS_VERSION=1.12.34.2
export LIBPNG_VERSION=1.2.56

pre_install () {
	apk add --no-cache \
		ca-certificates \
		libuuid \
		apr \
		apr-util \
		libjpeg-turbo \
		icu \
		icu-libs \
		openssl \
		pcre \
		zlib

	apk add --no-cache -t .build-deps \
		coreutils bash cmake curl python \
		libressl-dev libpng-dev icu-dev libjpeg-turbo-dev \
		tar musl-dev gcc pcre-dev zlib-dev \
		apr-dev apr-util-dev gperf libexecinfo-dev \
		libaio-dev build-base linux-headers file make || return 1

	mkdir -p \
		/usr/src/nginx \
		/usr/src/nginx-modules/nginx-pagespeed-module \
		/usr/src/libpng \
		/usr/src/nginx-modules/mod_pagespeed || return 1

	return 0
}

build_libpng () {
	curl --location http://prdownloads.sourceforge.net/libpng/libpng-${LIBPNG_VERSION}.tar.gz | \
		tar zx -C /usr/src/libpng --strip-components=1 || return 1

	cd /usr/src/libpng || return 1
	
	./configure --build=$CBUILD --host=$CHOST --prefix=/usr --enable-shared --with-libpng-compat || return 1
	
	make install V=0 || return 1

	return 0
}

build_nginx () {
	curl --location http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz | \
		tar zx -C /usr/src/nginx --strip-components=1 || return 1
	curl --location https://github.com/pagespeed/ngx_pagespeed/archive/v${NPS_VERSION}-beta.tar.gz | \
		tar zx -C /usr/src/nginx-modules/nginx-pagespeed-module --strip-components=1 || return 1
	curl -L --silent https://dl.google.com/dl/page-speed/psol/${NPS_VERSION}-x64.tar.gz | \
		tar zx -C /usr/src/build/nginx-modules/ngx_pagespeed 2>&1 || return 1
	
	cd /usr/src/nginx
	./configure \
		--with-cc-opt='-g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2' \
		--with-ld-opt='-Wl,-z,relro -Wl,--as-needed' \
                --user='www-data' \
		--group='www-data' \
		--prefix=/etc/nginx \
		--sbin-path=/usr/sbin/nginx \
		--conf-path=/etc/nginx/nginx.conf \
		--error-log-path=/data/logs/error.log \
		--http-log-path=/data/logs/access.log \
		--pid-path=/var/run/nginx.pid \
		--lock-path=/var/run/nginx.lock \
		--with-http_realip_module \
		--with-http_addition_module \
		--with-http_sub_module \
		--with-http_dav_module \
		--with-http_flv_module \
		--with-http_mp4_module \
		--with-http_gunzip_module \
		--with-http_gzip_static_module \
		--with-http_random_index_module \
		--with-http_secure_link_module \
		--with-http_stub_status_module \
		--with-file-aio \
		--with-compat \
		--with-http_ssl_module \
		--with-http_v2_module \
		--add-dynamic-module=/usr/src/nginx-modules/nginx-pagespeed-module

	make && make install || return 1

	return 0
}

cleanup () {
	apk del .build-deps || return 1

	return 0
}

build () {
	pre_install
	build_nginx
}

${@}
