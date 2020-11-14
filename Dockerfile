#
# Dockerfile for youtube-dl
#

FROM alpine

RUN \
    apk add --no-cache \
        ca-certificates \
        ffmpeg \
        openssl \
        python3 \
        aria2 \
        py3-pip \
    && pip3 install youtube-dl \
    && apk add --no-cache atomicparsley --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

# Try to run it so we know it works
RUN youtube-dl --version

WORKDIR /data

ENTRYPOINT ["youtube-dl"]
CMD ["--help"]
