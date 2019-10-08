FROM combro2k/alpine-base:latest

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

RUN \
	apk --quiet --no-cache add weechat weechat-aspell weechat-python weechat-perl weechat-lua python lua5.1 weechat-ruby ruby tmux dropbear bash libressl tor su-exec py3-websocket-client py2-websocket-client py2-six && \
	mkdir -p /data /data/weechat /data/dropbear /data/ssh && ln -s /data/dropbear /etc/dropbear && \
	adduser -s /bin/bash -D -u 1000 -h /home/weechat weechat && \
  echo -e 'set -g set-titles on\nset -g set-titles-string "#T"' > /home/weechat/.tmux.conf && \
	ln -s /data/weechat /home/weechat/.weechat && ln -s /data/ssh /home/weechat/.ssh && \
	chown weechat:weechat /home/weechat -R && \
	apk del --quiet --no-cache --purge && rm -rf /var/cache/apk/*

COPY resources/ /

VOLUME /data

EXPOSE 22/tcp
