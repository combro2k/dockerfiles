# alpine-weechat

[![](https://images.microbadger.com/badges/version/combro2k/alpine-weechat.svg)](https://microbadger.com/images/combro2k/alpine-weechat "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/combro2k/alpine-weechat.svg)](https://microbadger.com/images/combro2k/alpine-weechat "Get your own image badge on microbadger.com")

## Run (example with relay port 9001)
~~~
docker run -d \
	-p 9001:9001 \
	-p 5000:22 \
	combro2k/alpine-weechat:latest
~~~
