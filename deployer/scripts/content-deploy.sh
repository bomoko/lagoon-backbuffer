#!/bin/sh

cd /build
backbufferbuild.sh

cd /app

BACKBUFFER=${LAGOON_BACKBUFFER:-/build/public/}

rsync -av --delete $BACKBUFFER ./dist/
