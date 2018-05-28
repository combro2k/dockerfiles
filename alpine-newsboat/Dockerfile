FROM combro2k/alpine-base:latest

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

ENV \
  OPML_URLS="https://combro2k.github.io/opml/news.opml" \
  NEWSBOAT_MAX_ITEMS=100 \
  NEWSBOAT_RELOAD_TIME=15

RUN apk --no-cache add newsboat w3m su-exec && addgroup -g 1000 -S newsboat && \
  adduser -S -u 1000 -h /newsboat newsboat -D newsboat -G newsboat && \
  apk del --quiet --no-cache --purge && rm -rf /var/cache/apk/*

COPY resources/ /

VOLUME /newsboat/.newsboat

CMD ["/usr/local/bin/newsboat"]
