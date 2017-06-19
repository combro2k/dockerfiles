# alpine-netdata
alpine-netdata

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
