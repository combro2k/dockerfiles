# alpine-bigbrother-b3:latest

[![](https://images.microbadger.com/badges/version/combro2k/alpine-bigbrother-b3:latest.svg)](https://microbadger.com/images/combro2k/alpine-bigbrother-b3:latest "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/combro2k/alpine-bigbrother-b3:latest.svg)](https://microbadger.com/images/combro2k/alpine-bigbrother-b3:latest "Get your own image badge on microbadger.com")

To generate the config you can visit: https://statsgen.co.uk/b3-config-generator/

After that you can mount a volume mount on docker

To the bot run on foreground:
```
docker run -ti --rm -v /path/to/presistence/storage:/data combro2k/docker-b3:latest -s
```

To run the bot on background:
```
docker run -d -v /path/to/presistence/storage:/data combro2k/docker-b3:latest
```
