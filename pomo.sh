#!/usr/bin/env bash
BASE_DIR="$( dirname "$( realpath -s "${BASH_SOURCE[0]}" )" )/"
cd "$BASE_DIR" || exit 1

if [ $# -eq 4 ]
then
	work=$(($1 * 60 + $2))
	break=$(($3 * 60 + $4))
elif [ $# -eq 2 ]
then
	work=$(($1 * 60)); break=$(($2 * 60))
else
	for i in work break
	do
		read -r -p "${i}(min): " $i
		let $i=$i*60
	done
fi


printf "\e[1;31mpomo watcher is set to:\e[0;33m %02d.%02d\e[1;31m work time and\e[0;33m %02d.%02d\e[1;31m break time\e[0m\n" \
	$((work / 60)) $((work % 60)) $((break / 60)) $((break % 60))

while true
do
	mplayer 3Xalarm.WAV &>/dev/null &
	printf "\n\e[1;31m=== \e[33m work   \e[1;31m"
	printf "%0.s=" $(seq 1 $((${COLUMNS:-$(tput cols)}-12)) )
	printf "\e[0m\n"
	./count.sh -s $work


	mplayer mplayer efeitos_alarme.wav &>/dev/null &
	printf "\n\e[1;32m=== \e[33m break  \e[1;32m"
	printf "%0.s=" $(seq 1 $((${COLUMNS:-$(tput cols)}-12)) )
	printf "\e[0m\n"
	./count.sh -s $break
done
