[![status-badge](https://ci.spikedhand.com/api/badges/3/status.svg)](https://ci.spikedhand.com/repos/3)
![Docker Image Size](https://img.shields.io/docker/image-size/handspiker2/youtube-dl)


# Youtube-DL Container

Builds a container image containing YT-DLP (originally youtube-dl) to easily run as a container. 

## Updating to newer version

The image is automatically built by WoodPeckerCI based on YT-DLP's release RSS feed. As part of the build process the `:latest` tag is updated and a version number is tagged (IE: `handspiker2/youtube-dl:2025.08.27`). To update either `docker pull handspiker2/youtube-dl:latest` or update tag to the newest version dependimg on use-case.


## Usage

```
$ alias yt-dlp='docker run --rm -u $(id -u):$(id -g) -v $PWD:/data handspiker2/youtube-dl:latest'

# list all formats
$ yt-dlp -F 'https://www.youtube.com/watch?v=hHkKJfcBXcw'

# download it
$ yt-dlp 'https://www.youtube.com/watch?v=hHkKJfcBXcw'
```

## License

[CC0 1.0 Universal](https://creativecommons.org/publicdomain/zero/1.0/)

This project is effectively a personal build script. Do whatever you want with it. 
