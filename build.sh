#!/bin/sh
set -e

source_url=""
if [ -z "$YT_DLP_VERSION" ]; then
    echo "YT_DLP_VERSION argument empty, assuming latest release"
    source_url="https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.tar.gz"
elif [ "$YT_DLP_VERSION" = 'master' ]; then
    echo 'YT_DLP_VERSION is "master", building from newest commit'
    source_url="https://codeload.github.com/yt-dlp/yt-dlp/zip/refs/heads/master"
elif [ -n "$YT_DLP_VERSION" ]; then
    echo "YT_DLP_VERSION is \"$YT_DLP_VERSION\", assuming tagged release"
    source_url="https://github.com/yt-dlp/yt-dlp/releases/download/$YT_DLP_VERSION/yt-dlp.tar.gz"

else # TODO this catch is never used as all strings are consided tags
    echo "Unknown version"
    exit 1
fi 

# Requires `--break-system-packages` due to https://peps.python.org/pep-0668/
python3 -m pip install --break-system-packages yt-dlp[default]@"$source_url" \
&& apk add --no-cache atomicparsley --repository https://dl-cdn.alpinelinux.org/alpine/edge/testing/ --allow-untrusted
