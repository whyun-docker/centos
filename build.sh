#!/bin/bash
set -e

VERSION=7
TAG_LATEST=yunnysunny/centos:latest
TAG_CURRENT=yunnysunny/centos:${VERSION}

docker pull centos:${VERSION}
docker build . -f ./Dockerfile -t ${TAG_LATEST} -t ${TAG_CURRENT}
if [ "$NEED_PUSH" = "1" ] ; then
    docker push ${TAG_LATEST}
    docker push ${TAG_CURRENT}
fi