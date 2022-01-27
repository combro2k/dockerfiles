FROM combro2k/alpine-base:latest

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

RUN \
      apk --no-cache --virtual=.run-deps add bash curl netdata jq util-linux lsof && rm -rf /var/cache/apk/* && \
      ln -sf /dev/stdout /var/log/netdata/access.log && ln -sf /dev/stdout /var/log/netdata/debug.log && ln -sf /dev/stderr /var/log/netdata/error.log

COPY resources/ /

EXPOSE 19999/tcp
