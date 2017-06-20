# alpine-teamspeak3

TeamSpeak 3 server running on Alpine with SQLite3 database

To start this container use:

~~~
docker run -d \
	-v /your/own/presistence/path:/teamspeak3 \
	-p 9987:9987/udp \
	-p 30033:30033 \
	-p 10011:10011 \
	--rm \
	combro2k/alpine-teamspeak3:latest
~~~
