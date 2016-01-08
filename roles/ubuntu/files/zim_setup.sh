#! /bin/zsh
setopt EXTENDED_GLOB
for template_file ( ${ZDOTDIR:-${HOME}}/.zim/templates/* ); do
  user_file="${ZDOTDIR:-${HOME}}/.${template_file:t}"
  ( print -n "$(<${template_file})\n$(<${user_file})" >! ${user_file} ) 2>/dev/null
done
