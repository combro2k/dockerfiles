#!/usr/bin/env bash

BASE=$(readlink -f $(dirname $0))

cd ${BASE}

for file in */Dockerfile; do
  DIR=$(dirname ${file})
  IMAGE=$(basename ${DIR})

  echo -en  "\e[31m${IMAGE}\e[0m: "
  if [ -f ${DIR}/.travis_skip ]; then
    echo "Skipping..."
  else
    echo "Building..."
    docker build --pull --no-cache --rm --force-rm=true --tag combro2k/${IMAGE} ${BASE}/${DIR} || exit 1
    docker rmi combro2k/${IMAGE} || exit 1
  fi
  echo
done
