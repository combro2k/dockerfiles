FROM combro2k/alpine-base:latest

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

RUN set -xe && apk add --quiet --no-cache --virtual=.run-deps curl tar python3 && \
  mkdir /b3 && curl --location https://github.com/BigBrotherBot/big-brother-bot/archive/master.tar.gz | tar -zxC /b3 --strip-components=1 && \
  cd /b3 && pip3 install -r requirements.txt

COPY resources/ /

VOLUME /data
