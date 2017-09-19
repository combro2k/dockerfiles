FROM combro2k/alpine-nodejs:latest

LABEL \
        org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url="https://github.com/combro2k/dockerfiles/"

RUN \
	curl --silent --location https://github.com/TryGhost/Ghost/archive/master.tar.gz | tar zx -C /app --strip-components=1 && \
	cd /app && npm install
