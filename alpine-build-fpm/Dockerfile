FROM combro2k/alpine-base:latest

ENV GEM_PATH="/app"

RUN apk --no-cache --quiet --virtual=.run-deps add ruby libffi ruby-etc && \
  apk --no-cache --quiet --virtual=.build-deps add libffi-dev ruby-dev alpine-sdk && \
  apk --no-cache --quiet --virtual=.fpm-deps add py2-virtualenv dpkg xz python2-dev && \
  gem install fpm --no-rdoc --no-ri --install-dir /app && pip install virtualenv-tools

ADD resources/ /

RUN chmod +x /usr/bin/fpm

CMD /bin/sh
