#!/bin/sh

set -e

cd /build/
/build/backbufferbuild.sh

cd /app

BACKBUFFER=${LAGOON_BACKBUFFER:-/build/public/}

rsync -av --delete $BACKBUFFER ./dist/
