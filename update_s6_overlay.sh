#!/usr/bin/env bash

set -e
#set -x

BASE=$(readlink -f $(dirname $0))
VERSION=$1

if [ -z ${VERSION} ]; then
  echo "Please run with version number! Ex. ${0} 1.21.2.2"
  exit 1
fi

cd ${BASE}

for file in */Dockerfile; do
	DIR=$(dirname ${file})
	IMAGE=$(basename ${DIR})

  sed -i "s#^\(ARG S6_OVERLAY_VERSION\)=[^$]*#\1=${VERSION}#g" ${file}
done
