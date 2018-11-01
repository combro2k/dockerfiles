FROM combro2k/alpine-base:latest

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

ENV \
	POSTFIX_MYSQL_DATABASE=postfix \
	POSTFIX_MYSQL_USER=postfix \
	POSTFIX_MYSQL_PASSWORD=postfix \
	MYSQL_PORT_3306_TCP_ADDR=172.17.0.1 \
	MYSQL_PORT_3306_TCP_PORT=3306 \
	S6_KILL_GRACETIME=10000

RUN set -xe && \
	addgroup -g 1000 -S vmail && \
	adduser -S -u 1000 -h /var/vmail -s /usr/sbin/nologin -D vmail -G vmail && \
	addgroup -g 1001 -S assp && \
	adduser -S -u 1001 -h /usr/share/assp -s /usr/sbin/nologin -D assp -G assp && \
	apk add --quiet --no-cache --virtual=run-deps \
		bash \
		perl-dev \
		postfix \
		postfix-mysql \
		postfix-pgsql \
		dovecot-pop3d \
		dovecot-lmtpd \
		dovecot \
		dovecot-mysql \
		dovecot-sqlite \
		dovecot-pigeonhole-plugin \
		clamav \
		clamav-libunrar \
		spamassassin \
		amavisd-new \
		mysql-client \
		curl \
		ca-certificates \
		openssl \
		perl-net-cidr-lite \
		perl-crypt-cbc \
		perl-dbd-mysql \
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
		perl-io-socket-inet6 \
		perl-file-readbackwards \
		perl-archive-zip \
		perl-io-gzip \
		perl-compress-raw-bzip2 \
		perl-lwp-protocol-https \
		perl-ldap && \
	 apk add --quiet --no-cache --virtual=.build-deps make alpine-sdk gcc perl-dev openssl-dev snowball-dev && \
	 mkdir -p /usr/share/assp /run/clamav/ && chown clamav:clamav /run/clamav/ -R && \
	 curl -L -s https://cpanmin.us/ --output /bin/cpanm && chmod +x /bin/cpanm && cpanm -v -n \
		Archive::Extract Lingua::Stem::Snowball Lingua::Identify Crypt::OpenSSL::AES Mail::SPF::Query Mail::SRS Regexp::Optimizer Thread::State Sys::MemInfo \
		Text::Unidecode Schedule::Cron Email::Send Tie::RDBM Sys::CpuAffinity Unicode::GCString Convert::Scalar File::Scan::ClamAV && \
	 curl -L -s https://netix.dl.sourceforge.net/project/assp/ASSP%20V2%20multithreading/2.6.1%20latest%20fixup/ASSP_2.6.1_18305.zip --output /tmp/assp.zip && \
   cd /usr/share && unzip /tmp/assp.zip && mkdir -p /usr/share/assp/tmpDB/files /usr/share/assp/quarantine /usr/share/assp/notspam /usr/share/assp/spam /usr/share/assp/download && \
   chown assp:assp -R /usr/share/assp && rm /tmp/assp.zip && apk del --quiet --no-cache --purge && rm -rf /var/cache/apk/* && \
   apk del --quiet --no-cache --purge .build-deps && apk --no-cache --quiet fix openssl

COPY resources/ /

EXPOSE 55555/tcp \
	55553/tcp \
	25/tcp \
	110/tcp \
	143/tcp \
	465/tcp \
	587/tcp \
	993/tcp \
	995/tcp \
	4190/tcp
	
VOLUME /data /var/vmail
