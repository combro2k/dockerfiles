FROM combro2k/alpine-nodejs:latest

RUN \
	curl -L https://github.com/eirikb/weecloud/archive/master.tar.gz | tar zx -C /app --strip-components=1 && \
	cd /app && npm install

COPY resources/ /

EXPOSE 3000/tcp
