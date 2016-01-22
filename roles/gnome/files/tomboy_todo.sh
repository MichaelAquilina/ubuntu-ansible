#! /bin/sh
today=$(date +%Y-%m-%d)

# Opens a tomboy note with today's date as a title or creates it if it doesnt exist
grep "<title>$today</title>" -r ~/.local/share/tomboy -h
echo $?
if [ $? -eq 0 ];
then
  tomboy --new-note "$today"
else
  tomboy --open-note "$today"
fi
