#! /bin/bash
if [ -n "$1" ]; then
  TARGET=$1
else
  TARGET="."
fi

GREEN="$(tput setaf 2)"
RED="$(tput setaf 1)"
RESET="$(tput sgr0)"

IFS=$'\n'
GIT_DIRECTORIES="$(find $TARGET -name ".git" -type d)"
for directory in $GIT_DIRECTORIES;
do
  NAME="$(dirname $directory)"
  pushd $NAME > /dev/null

  STATUS="$(git status --porcelain)"

  COLOR=$RED
  if [[ -z "$STATUS" ]]; then
    COLOR=$GREEN
    STATUS="Clean"
  fi
  echo $RESET${NAME:2}: $COLOR$STATUS
  popd > /dev/null
done
