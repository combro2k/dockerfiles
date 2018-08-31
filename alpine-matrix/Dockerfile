FROM combro2k/alpine-base:latest

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

RUN apk --virtual=.build-deps --no-cache add python2-dev alpine-sdk py2-pip libffi-dev libressl-dev && \
  apk --no-cache add curl tar python2 libffi libressl py2-psutil py2-pillow && \
  pip2 install https://github.com/matrix-org/synapse/tarball/master
