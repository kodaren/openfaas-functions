#!/bin/sh

url=""
if [ ! -z "$1" ] ; then
  url=$1
else
  url=$(cat /dev/stdin)
fi

trimmedURL=$(echo "$url" | tr -d '\n')

youtube-dl --no-warnings --quiet -o - $trimmedURL
