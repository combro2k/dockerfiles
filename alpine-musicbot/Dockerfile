FROM combro2k/alpine-base:latest

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

ENV APP_ENV=docker

RUN apk add --no-cache ca-certificates ffmpeg opus python3 libsodium-dev py3-wheel py3-pip && \
  apk add --no-cache --virtual .build-deps gcc g++ git libffi-dev make musl-dev python3-dev && \
  addgroup -g 1000 -S musicbot && adduser -S -u 1000 -h /musicbot musicbot -D musicbot -G musicbot && \
  mkdir -p /app/MusicBot && git clone https://github.com/Just-Some-Bots/MusicBot.git /app/MusicBot -b review && \
  cd /app/MusicBot && sed -i 's~^pynacl==[^$]*~pynacl==1.3.0~g' requirements.txt && \
  pip3 install --no-cache-dir -r requirements.txt && pip3 install --upgrade --force-reinstall --version websockets==4.0.1 && \
  chown -R musicbot:musicbot /app/MusicBot && \
  apk del .build-deps

COPY resources/ /

VOLUME /musicbot
