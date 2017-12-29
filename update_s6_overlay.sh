#!/usr/bin/env bash

set -e
#set -x

BASE=$(readlink -f $(dirname $0))
VERSION=$1

if [ -z ${VERSION} ]; then
  echo "Please run with version number! Ex. ${0} v1.21.2.2"
  exit 1
fi

cd ${BASE}

for file in */Dockerfile; do
	DIR=$(dirname ${file})
	IMAGE=$(basename ${DIR})

	sed -i "s#\(https://github.com/just-containers/s6-overlay/releases/download\)/[^/]*/\(s6-overlay-amd64.tar.gz\)#\1/${VERSION}/\2#g" ${file}

	#break
done
