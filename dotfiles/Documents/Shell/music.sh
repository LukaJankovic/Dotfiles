#!/bin/bash

players=( "google-play-music-desktop-player" "spotify" )

check()
{
	artist=$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.$1 /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' 2> /dev/null | egrep -A 2 "artist" | egrep -v "artist" | egrep -v "array" | cut -b 27- | tr '"' "'" | egrep -v ^$)

	title=$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.$1 /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' 2> /dev/null | egrep -A 1 "title" | egrep -v "title" | cut -b 44- | tr '"' "'" | egrep -v ^$)

	empty=0

	if [ -n "$artist" ] 
	then
		artist="${artist::-1}"
	else
		empty=1
	fi
	
	if [ -n "$title" ]
	then	
		title="${title::-1}"
	else
		empty=1	
	fi
	
	if [ $empty = 0 ]
	then
		echo ${artist} - ${title}
	else
		echo ""
	fi
}

done=0

for element in ${players[@]}
do
	res=$( check $element )
	if [ $done -eq "0" ]
	then
		echo $res
		done=1
	fi		
done

if [ $done -eq "0" ]
then
	echo ""
fi
