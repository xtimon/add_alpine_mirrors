#!/bin/sh

ALPINE_VERSION="v$(cut -d. -f1 /etc/alpine-release).$(cut -d. -f2 /etc/alpine-release)"

TEMP_FILE=$(mktemp)

wget ${MIRRORS_LIST:="http://rsync.alpinelinux.org/alpine/MIRRORS.txt"} -O $TEMP_FILE

for mirror in $(head -${MIRRORS_COUNT:=5} $TEMP_FILE)
do
  echo "${mirror}$ALPINE_VERSION/main" >> /etc/apk/repositories
  echo "${mirror}$ALPINE_VERSION/community" >> /etc/apk/repositories
done

rm $TEMP_FILE $0
