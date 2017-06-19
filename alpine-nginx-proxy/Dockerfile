#FROM alpine:edge
FROM frolvlad/alpine-glibc:latest

ADD resources/patches/ /usr/src/patches
ADD resources/bin/ /usr/local/bin

RUN chmod +x /usr/local/bin/* && /usr/local/bin/setup.sh build
