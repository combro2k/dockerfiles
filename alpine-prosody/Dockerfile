FROM combro2k/alpine-base:latest

LABEL \
        org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url="https://github.com/combro2k/dockerfiles/"

RUN apk --no-cache --progress add curl prosody lua5.1-lzlib openssl && apk del --quiet --no-cache --progress --purge && rm -rf /var/cache/apk/*

COPY resources/ /

VOLUME /var/lib/prosody /prosody

EXPOSE 5222/tcp 5269/tcp 5280/tcp 5281/tcp
