FROM container4armhf/armhf-alpine:3.6
MAINTAINER Jordan Clark jordan.clark@esu10.org
LABEL architecture="ARMv7"

ENV S6_OVERLAY_VERSION 1.19.1.0
ENV S6_ARCH_TYPE armhf

RUN apk add --no-cache wget ca-certificates && \
apk --no-cache --update upgrade && \
cd /tmp && \
wget https://github.com/just-containers/s6-overlay/releases/download/v$S6_OVERLAY_VERSION/s6-overlay-$S6_ARCH_TYPE.tar.gz && \
tar xzf s6-overlay-$S6_ARCH_TYPE.tar.gz -C / && \
rm s6-overlay-$S6_ARCH_TYPE.tar.gz

COPY container-files /

ENTRYPOINT ["/init"]
