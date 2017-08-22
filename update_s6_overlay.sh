#!/usr/bin/env bash

set -e
set -x

BASE=$(readlink -f $(dirname $0))
VERSION=$1

cd ${BASE}

for file in */Dockerfile; do
	DIR=$(dirname ${file})
	IMAGE=$(basename ${DIR})

	sed -i "s#\(https://github.com/just-containers/s6-overlay/releases/download\)/[^/]*/\(s6-overlay-amd64.tar.gz\)#\1/${VERSION}/\2#g" ${file}

	#break
done
