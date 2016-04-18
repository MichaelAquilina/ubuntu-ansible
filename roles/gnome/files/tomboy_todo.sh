#! /bin/sh
if [ -n "$1" ]; then
  echo $1
  DATE="$1"
else
  DATE="today"
fi

target=$(date +%Y-%m-%d -d $DATE)

# Opens a tomboy note with target's date as a title or creates it if it doesnt exist
grep "<title>$target</title>" -r ~/.local/share/tomboy -h
echo $?
if [ $? -eq 0 ];
then
  tomboy --new-note "$target"
else
  tomboy --open-note "$target"
fi
