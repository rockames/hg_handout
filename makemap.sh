#!/bin/bash

file=announcements.md

> announce_map.md

IFS=''
while read line
do
    echo $line | grep -q "!map"
    if [ $? == 0 ]; then
        out=`echo $line | cut -d "[" -f3 | cut -d "]" -f1`
        zoom=`echo $line | cut -d "[" -f4 | cut -d "]" -f1`
        loc=`echo $line | cut -d "(" -f2 | cut -d ")" -f1`
        url="http://maps.googleapis.com/maps/api/staticmap?size=1000x300&maptype=roadmap&style=saturation:-100&zoom=$zoom&markers=color:gray%7C$loc&format=png"
        wget $url -O $out.png
        echo "\includegraphics[scale=.35]{$out.png}" >> announce_map.md
       # echo "![$out]($out.png)" >> announce_map.md
    else
        echo "$line" >> announce_map.md
    fi

done < $file


