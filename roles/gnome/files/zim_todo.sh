#! /bin/sh
if [ -n "$1" ]; then
  echo $1
  DATE="$1"
else
  DATE="today"
fi

target=$(date +%Y:%m:%d -d $DATE)

zim Notes "TODO:$target"
