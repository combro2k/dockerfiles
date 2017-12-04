FROM combro2k/alpine-base:latest

ENV LC_ALL=en_GB.UTF-8 \
	PID_FILE=/run/mysqld/mysqld.pid

RUN set -xe && apk --no-cache --progress add mariadb mariadb-client && \
  	apk del --no-cache --progress --purge && rm -rf /var/cache/apk/*

COPY resources/ /

EXPOSE 3306/tcp

VOLUME /var/lib/mysql
