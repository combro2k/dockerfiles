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
  FUGLU_DB_DATABASE=fuglu \
  FUGLU_DB_USERNAME=fuglu \
  FUGLU_DB_PASSWORD=password \
  FUGLU_DB_HOST=172.17.0.1 \
  FUGLU_DB_PORT=3306 \
	S6_KILL_GRACETIME=10000

RUN set -xe && \
	addgroup -g 1000 -S vmail && \
	adduser -S -u 1000 -h /var/vmail -s /usr/sbin/nologin -D vmail -G vmail && \
	apk add --quiet --no-cache --virtual=.run-deps \
    p7zip \
    unrar \
    mariadb-connector-c \
    mariadb-client \
		bash \
		postfix \
		postfix-mysql \
		postfix-pgsql \
		dovecot \
		dovecot-mysql \
		dovecot-sqlite \
		dovecot-pop3d \
		dovecot-lmtpd \
		dovecot-pigeonhole-plugin \
		clamav \
		clamav-libunrar \
		spamassassin \
		mysql-client \
		curl \
		ca-certificates \
    findutils \
    su-exec \
		openssl && \
   apk add --quiet --no-cache --virtual=.testing-run-deps --repository http://nl.alpinelinux.org/alpine/edge/testing \
    python3 py3-pip py3-magic py3-rarfile py3-beautifulsoup4 py3-sqlalchemy py3-redis && \
   apk add --quiet --no-cache --virtual=.build-deps python3-dev alpine-sdk mariadb-connector-c-dev && \
	 mkdir -p /run/clamav/ && chown clamav:clamav /run/clamav/ -R && \
   /usr/bin/pip3 install pysrs pylzma mysqlclient pyspf dkimpy py3dns && \
   mkdir -p /tmp/fuglu && curl -L https://gitlab.com/fumail/fuglu/-/archive/master/fuglu-master.tar.gz | tar zxv -C /tmp/fuglu --strip-components=1 && \
   cd /tmp/fuglu/fuglu && python3 setup.py install && cd && rm -fr /tmp/fuglu && \
   apk del --quiet --no-cache --purge && rm -rf /var/cache/apk/* && \
   apk del --quiet --no-cache --purge .build-deps && apk --no-cache --quiet fix openssl

COPY resources/ /

EXPOSE \
	25/tcp \
	110/tcp \
	143/tcp \
	465/tcp \
	587/tcp \
	993/tcp \
	995/tcp \
	4190/tcp
	
VOLUME /data /var/vmail
