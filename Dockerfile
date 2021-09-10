#
# Dockerfile for youtube-dl
#

FROM alpine:latest

RUN apk add --no-cache \
        ca-certificates \
        ffmpeg \
        openssl \
        python3 \
        aria2 \
        py3-pip \
        curl

ARG BUILD_DATE
LABEL org.label-schema.build-date=$BUILD_DATE

RUN \ 
    curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp \
    && chmod a+rx /usr/local/bin/yt-dlp \
    && apk add --no-cache atomicparsley --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

# Try to run it so we know it works
RUN yt-dlp --version

WORKDIR /data

ENTRYPOINT ["yt-dlp"]
CMD ["--help"]
