FROM combro2k/alpine-base:latest

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

ENV LC_ALL=en_GB.UTF-8 \
	PID_FILE=/run/mysqld/mysqld.pid

RUN set -xe && apk --no-cache add mariadb mariadb-client && \
  	apk del --no-cache --purge && rm -rf /var/cache/apk/*

COPY resources/ /

EXPOSE 3306/tcp

VOLUME /var/lib/mysql
