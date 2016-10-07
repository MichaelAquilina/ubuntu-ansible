#! /bin/sh
if [ -n "$1" ]; then
  echo $1
  DATE="$1"
else
  DATE="today"
fi

target=$(date +%Y-%m-%d -d $DATE)

# Opens a gnote note with target's date as a title or creates it if it doesnt exist
grep "<title>$target</title>" -r ~/.local/share/tomboy -h
echo $?
if [ $? -eq 0 ];
then
  gnote --new-note "$target"
else
  gnote --open-note "$target"
fi
