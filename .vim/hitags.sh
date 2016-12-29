#!/bin/bash  

ctags -R --fields=+l ;
awk -F '"' '$2 ~ /^\tf/    {print $1 "\n"}' tags | awk '$1 ~ /^[a-zA-Z]/ {print "syn keyword cFunction " $1}' 1>  tags.vim ;
awk -F '"' '$2 ~ /^\t[de]/ {print $1 "\n"}' tags | awk '$1 ~ /^[a-zA-Z]/ {print "syn keyword cMacro" $1}' 1>> tags.vim ;
awk -F '"' '$2 ~ /^\tt/    {print $1 "\n"}' tags | awk '$1 ~ /^[a-zA-Z]/ {print "syn keyword cTypedef " $1}' 1>> tags.vim ;
awk -F '"' '$2 ~ /^\tv/    {print $1 "\n"}' tags | awk '$1 ~ /^[a-zA-Z]/ {print "syn keyword cGlobal" $1}' 1>> tags.vim ;
