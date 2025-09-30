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
        curl \
        # https://github.com/yt-dlp/yt-dlp/issues/14404
        deno

ARG BUILD_DATE
ARG YT_DLP_VERSION=""
LABEL org.label-schema.build-date=$BUILD_DATE

COPY build.sh docker-entrypoint.sh /
RUN \
    apk add --no-cache --virtual build-dependencies build-base python3-dev \
    && chmod +x /build.sh \
    && /build.sh \
    && apk del build-dependencies

# Try to run it so we know it works
RUN yt-dlp --version

WORKDIR /data

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["--help"]
