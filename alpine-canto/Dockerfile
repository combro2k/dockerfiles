FROM combro2k/alpine-base:latest

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

RUN apk --no-cache add curl tar python3 && apk --no-cache add --virtual=.build-deps readline-dev ncurses-dev alpine-sdk python3-dev && \
	mkdir -p /app/canto-next /app/canto-curses && pip3 install feedparser && \
	curl --location https://github.com/themoken/canto-next/archive/master.tar.gz | tar zx -C /app/canto-next --strip-components=1 && \
	cd /app/canto-next && python3 setup.py install && \
	curl --location https://github.com/themoken/canto-curses/archive/master.tar.gz | tar zx -C /app/canto-curses --strip-components=1 && \
	cd /app/canto-curses && python3 setup.py install && cd /tmp && \
	rm -fr /app && apk --no-cache --purge del .build-deps
