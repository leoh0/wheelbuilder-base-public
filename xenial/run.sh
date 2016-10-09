#!/usr/bin/env bash

VERSION=${PWD##*/}
IMAGE_NAME=${IMAGE_NAME:-leoh0/wheelbuilder-base-$VERSION}
TAG=${TAG:-liberty}

OPTS=""
if [[ "$1" == "fresh" ]]; then
  OPTS="--no-cache"
fi

docker build $OPTS --build-arg BRANCH=$TAG -t $IMAGE_NAME:$TAG .

if [[ $? == 0 ]]; then
  rm -rf .wheelhouse && mkdir -p .wheelhouse
  docker run --rm -ti -v $(pwd)/.wheelhouse:/.wheelhouse $IMAGE_NAME:$TAG bash
fi
