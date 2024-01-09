# docker-snapcast (whith shairplay-sync support)

[**Snapcast**](https://github.com/badaix/snapcast) Docker image based on [**Alpine Linux**](https://www.alpinelinux.org/).

## Features:
- Based on Alpine Linux: smaller than a debian based image.
- Runs on Raspberry Pi (tested on Model 4B), other packages available
- Uses the latest snapcast/shairplay-sync version from archlinux repo  

## Usage 

1. Pull from ghcr.io
2. It will need a mounted volume to access the stream from mopidy as well as the actual pipe. Example configuration in [Streaming Audio](https://github.com/mcb/streaming-audio)

## License
MIT License
