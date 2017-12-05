FROM combro2k/alpine-nodejs:latest

LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-scheme.dockerfile=$DOCKERFILE

RUN \
	curl -L https://github.com/eirikb/weecloud/archive/master.tar.gz | tar zx -C /app --strip-components=1 && \
	cd /app && npm install

COPY resources/ /

EXPOSE 3000/tcp
