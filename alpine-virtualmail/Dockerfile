FROM gliderlabs/alpine:edge

ENV \
	POSTFIX_MYSQL_DATABASE=postfix \
	POSTFIX_MYSQL_USER=postfix \
	POSTFIX_MYSQL_PASSWORD=postfix \
	MYSQL_PORT_3306_TCP_ADDR=172.17.0.1 \
	MYSQL_PORT_3306_TCP_PORT=3306	

RUN set -xe && \
	    addgroup -g 1000 -S vmail && adduser -S -u 1000 -h /var/vmail -s /usr/sbin/nologin -D vmail -G vmail && \
	    apk --quiet --no-cache upgrade && \
	    apk add --quiet --no-cache --virtual=.build-deps \
		make alpine-sdk gcc perl-dev openssl-dev && \
	    apk add --quiet --no-cache --virtual=run-deps \
		bash \
		perl-dev \
	    	postfix \
		postfix-mysql \
		postfix-pgsql \
		dovecot \
		dovecot-mysql \
		dovecot-sqlite \
		dovecot-pigeonhole-plugin \
		clamav \
		spamassassin \
		amavisd-new \
		mysql-client \
		curl \
		ca-certificates \
		openssl \
		perl-net-cidr-lite \
		perl-email-simple \
		perl-net-ssleay \
		perl-io-socket-ssl \
		perl-email-mime \
		perl-ipc-system-simple \
		perl-unicode-string \
		perl-regexp-common \
		perl-authen-sasl \
		perl-mail-spf \
		perl-mime-types \
		perl-mail-clamav \
		perl-net-smtp-ssl \
		perl-file-readbackwards \
		perl-archive-zip \
		perl-io-gzip \
		perl-compress-raw-bzip2 \
		perl-lwp-protocol-https \
		perl-ldap && \
	    mkdir -p /usr/share/assp && \
	    curl -L -s http://xrl.us/cpanm --output /bin/cpanm && chmod +x /bin/cpanm && \
	    cpanm -n Regexp::Optimizer \
		Thread::State \
		Sys::MemInfo \
		Text::Unidecode \
		Schedule::Cron \
		Email::Send\
		Tie::RDBM \
		Sys::CpuAffinity \
		Unicode::GCString \
		Convert::Scalar \
		File::Scan::ClamAV && \
	    curl -L -s https://downloads.sourceforge.net/project/assp/ASSP%20V2%20multithreading/2.5.5%2017073/ASSP_2.5.5_17073_install.zip \
		    --output /tmp/assp.zip && cd /usr/share && unzip /tmp/assp.zip && rm /tmp/assp.zip && \
		    curl -L -s https://github.com/just-containers/s6-overlay/releases/download/v1.19.1.1/s6-overlay-amd64.tar.gz | tar zx -C /

COPY resources/ /

EXPOSE 55555/tcp 55553/tcp 25/tcp

RUN set -xe && apk --no-cache --purge del .build-deps && apk del --quiet --no-cache --progress --purge && rm -rf /var/cache/apk/*

VOLUME /data /var/vmail

ENTRYPOINT ["/init"]
