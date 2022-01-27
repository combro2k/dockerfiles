#!/usr/bin/env bash

set -e
#set -x

BASE=$(readlink -f $(dirname $0))
CURVERSION=$1
NEWVERSION=$2

if [ -z ${CURVERSION} ] || [ -z ${NEWVERSION} ]; then
  echo "Please run with version number! Ex. ${0} 1.21.2.2 1.21.2.3"
  exit 1
fi

cd ${BASE}

for file in */Dockerfile; do
	DIR=$(dirname ${file})
	IMAGE=$(basename ${DIR})

  sed -i "s#\(https://github.com/just-containers/s6-overlay/releases/download\)/[^/]*/\(s6-overlay-x86_64-${CURVERSION}.tar.xz\)#\1/v${NEWVERSION}/s6-overlay-x86_64-${NEWVERSION}\.tar\.xz#g" ${file}

	#break
done
