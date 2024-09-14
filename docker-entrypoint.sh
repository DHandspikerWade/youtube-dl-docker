#!/bin/sh

if [ -n "$UMASK" ]; then
    umask "$UMASK"
fi

exec yt-dlp "$@"
