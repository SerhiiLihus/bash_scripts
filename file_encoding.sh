#!/bin/bash
# using example: bash change_encoding.sh html new windows-1251 cyrillic
file_path="$1" # path to the current directory
search_extension="$2" # extension which we search
if [ -z "$3" ] # if encoding didn't found 
then
  echo "Enter charset and encoding"
else
  encoding="$3"
  for files in "$file_path"/* 
  do
    filename=$(basename "$files") # get filename without forward path. Like ./one.html -> one.html
    extension="${filename##*.}"
    if [ "$extension" == "$search_extension" ] 
    then
      for encodings in "$encoding" ; 
      do
        if iconv -f "$encodings" -t utf-8 "$filename" > "$filename.new"; then
          echo "$filename: encoded"
        else
          echo "$filename: skipped cannot encode"
        fi 
      done 
    fi
  done
fi