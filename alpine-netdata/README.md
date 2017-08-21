# alpine-netdata

[![](https://images.microbadger.com/badges/version/combro2k/alpine-netdata.svg)](https://microbadger.com/images/combro2k/alpine-netdata "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/combro2k/alpine-netdata.svg)](https://microbadger.com/images/combro2k/alpine-netdata "Get your own image badge on microbadger.com")

## Run
~~~
docker run -d \
	--cap-add SYS_PTRACE \
	-v /proc:/host/proc:ro \
	-v /sys:/host/sys:ro \
	-v /var/run/docker.sock:/var/run/docker.sock:ro \
	-p 19999:19999 \
	combro2k/alpine-netdata:latest
~~~
