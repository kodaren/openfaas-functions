#!/bin/sh

url=""
if [ ! -z "$1" ] ; then
  url=$1
else
  url=$(cat /dev/stdin)
fi

trimmedURL=$(echo "$url" | tr -d '\n')

originalFileName=$(youtube-dl --get-filename -o '%(title)s.%(ext)s' $trimmedURL --restrict-filenames)
trimmedFileName=$(echo "$originalFileName" | tr -d '\n')
echo -n $trimmedFileName

