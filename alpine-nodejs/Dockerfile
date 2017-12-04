FROM combro2k/alpine-base:latest

RUN \
	apk --quiet --no-cache add nodejs nodejs-npm curl tar && mkdir -p /app && \
	apk del --quiet --no-cache --progress --purge && rm -rf /var/cache/apk/*
