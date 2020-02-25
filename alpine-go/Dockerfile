FROM combro2k/alpine-base:latest

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

RUN set -xe && apk add --quiet --no-cache --virtual=.build-deps git go
ONBUILD RUN if [ -x /app/build ] && sh /app/build && rm /app/build && apk --quiet --no-cache del .build-deps 

COPY resources/ /
