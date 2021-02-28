#!/usr/bin/env bash

motd=\
"task1 version 0.0.1
Copyright 2021 Anton Pereboev.
task1 is free software, covered by the GNU General Public License, and you are
welcome to change it and/or distribute copies of it under certainconditions.
There is absolutely no warranty for task1."

echo "$motd"

while :
do
    read -p "Enter file name: " fname

    ls -l "$fname" &>> /dev/null
    rv=$?

    if  [ "$rv" ]; then
    # if [ -f "$fname" ]; then
        str1=$(basename "$fname")
        str2=$(stat --format "%F %s %U %A %y" "$fname")
        echo "$str1" "$str2"
    else
        1>&2 echo "$fname don't exists"
    fi

    while : ; do
        read -p "Would you like to continue? [y/N] " do_exit
        if [ "$do_exit" == "y" ]; then
            break;
        elif [ "$do_exit" == "n" ]; then
            echo "$rv"
            exit "$rv"
        elif [[ -z "$do_exit" ]]; then
            echo "$rv"
            exit "$rv"
        else
            echo "You need to choose"
        fi
    done
done

