#! /bin/sh
title="Retrospective $(date +"%U - %b")"

# Opens a tomboy note with today's date as a title or creates it if it doesnt exist
grep "<title>$title</title>" -r ~/.local/share/tomboy -h
echo $?
if [ $? -eq 0 ];
then
  tomboy --new-note "$title"
else
  tomboy --open-note "$title"
fi
