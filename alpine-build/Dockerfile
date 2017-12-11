FROM combro2k/alpine-base:latest

RUN apk --no-cache --quiet --progress --virtual=.run-deps add ruby && \
  apk --no-cache --quiet --progress --virtual=.build-deps add libffi-dev ruby-dev alpine-sdk && \
  gem install fpm --no-rdoc --no-ri && apk --no-cache --quiet --progress del .build-deps

RUN /bin/sh 
