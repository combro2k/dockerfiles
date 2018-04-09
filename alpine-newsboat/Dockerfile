FROM combro2k/alpine-base:latest

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

RUN apk --no-cache add newsboat su-exec && addgroup -g 1000 -S newsboat && \
  adduser -S -u 1000 -h /newsboat newsboat -D newsboat -G newsboat && \
  apk del --quiet --no-cache --progress --purge && rm -rf /var/cache/apk/*

COPY resources/ /

VOLUME /newsboat/.newsboat
