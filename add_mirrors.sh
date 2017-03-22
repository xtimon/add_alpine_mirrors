#!/bin/sh

MIRRORS_LIST="http://rsync.alpinelinux.org/alpine/MIRRORS.txt"
ALPINE_VERSION="v$(cut -d. -f1 /etc/alpine-release).$(cut -d. -f2 /etc/alpine-release)"

TEMP_FILE=$(mktemp)
wget $MIRRORS_LIST -O $TEMP_FILE

for mirror in $(cat $TEMP_FILE)
do
  echo "${mirror}/$ALPINE_VERSION/main" | sed s"'//'/'" >> /etc/apk/repositories
  echo "${mirror}/$ALPINE_VERSION/community" | sed s"'//'/'" >> /etc/apk/repositories
done

rm $TEMP_FILE $0
