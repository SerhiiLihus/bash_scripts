#!/bin/bash
# using example: ./replaceStringFile.sh /path/to/file1 /path/to/file2

# trim spaces
function trim() {
    echo "$1" | sed "s/\d+//g" | sed "s/\r//g"
}

filePath1="$1"
filePath2="$2"

while IFS="," read -r oldID newID
do
    trimmedOldID=$(trim $oldID)
    trimmedNewID=$(trim $newID)
    sed -i "s/$trimmedOldID/$trimmedNewID/" $filePath2
done < <(tail -n +2 $filePath1)
