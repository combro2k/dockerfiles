FROM combro2k/alpine-base:3.15

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

RUN set -xe && apk add --quiet --no-cache curl tar python2 && \
  curl https://bootstrap.pypa.io/pip/2.7/get-pip.py | python2 - && adduser -D b3 && \
  mkdir /b3 && curl --location https://github.com/BigBrotherBot/big-brother-bot/archive/master.tar.gz | tar -zxC /b3 --strip-components=1 && \
  cd /b3 && python2 -m pip install -r requirements.txt && mkdir /data && touch b3.ini

COPY resources/ /

VOLUME /data
