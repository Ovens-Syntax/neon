#!/bin/bash

tput smcup
tput civis

while true
do
until [[ "$oldpath" != "$path" ]]
do

artist=$(mpc -f %artist% | sed -n '1p')
album=$(mpc -f %album% | sed -n '1p') 
albumdir="$artist - $album"
if [ ! -e "/home/oven/Music/$albumdir/cover.jpg" ] 
then
path="/home/oven/Music/$albumdir/cover.png"
else 
path="/home/oven/Music/$albumdir/cover.jpg"
fi

sleep 2 

done
	chafa --clear --center on --format symbols "$path"
	wal -q -i "$path" 
	oldpath=$path
done
