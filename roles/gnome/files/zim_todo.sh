#! /bin/sh
if [ -n "$1" ]; then
  echo $1
  DATE="$1"
else
  DATE="today"
fi

folder=$(date +%Y-%m -d $DATE)
target=$(date +%Y-%m-%d -d $DATE)

zim Notes "TODO:$folder:$target"
