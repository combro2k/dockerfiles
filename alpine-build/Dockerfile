FROM combro2k/alpine-base:latest

RUN apk add --no-cache --quiet alpine-sdk shadow && \
  adduser -D builder &&  mkdir -p /var/cache/distfiles && \
  chgrp abuild /var/cache/distfiles &&  chmod a+w /var/cache/distfiles && \
  addgroup builder abuild

COPY resources/ /

USER builder

RUN abuild-keygen -a -i -q -n

USER root

CMD ['su', '-', 'builder']
