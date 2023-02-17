## Forked from [https://github.com/vimagick/dockerfiles/tree/master/youtube/youtube-dl](https://github.com/vimagick/dockerfiles/tree/master/youtube/youtube-dl)
#### Not a direct fork as vimagick keeps all their projects in a single repo. Orignally used youtube-dl but have since switched to the fork named yt-dlp. Parameters are largely the same.


youtube-dl
==========

~~youtube-dl~~ [yt-dlp](https://github.com/yt-dlp/yt-dlp) is a small command-line program to download videos from <https://www.youtube.com/> and a few more sites.

## Tutorial

```bash
# create an alias
$ alias yt='docker run --rm -u $(id -u):$(id -g) -v $PWD:/data handspiker2/youtube-dl'

# list all formats
$ yt -F hHkKJfcBXcw

# download it
$ yt hHkKJfcBXcw

# play it
$ vlc *-hHkKJfcBXcw.mp4
```


