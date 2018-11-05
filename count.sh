#!/usr/bin/env bash
if [ "$1" = "-s" ] || [ "$1" = "--silent" ]; then
	silent="1"
	shift
fi

if [ $# -eq 3 ]; then
	hour=$1; min=$2; sec=$3
elif [ $# -eq 2 ]; then
	min=$1; sec=$2
elif [ $# -eq 1 ]; then
	sec=$1
else
	for i in hour min sec
	do
		read -r -p "${i}: " $i
	done
fi

if [ "${sec:=0}" -ge 60 ]; then
	min=$((min + sec / 60))
	sec=$((sec % 60))
fi

if [ ${min:=0} -ge 60 ]; then
	hour=$((hour + min / 60))
	min=$((min % 60))
fi

[[ -z "$silent" ]] && printf "\e[0;37mcounter is set to:\e[1;33m %02d:%02d:%02d\e[0m\n" ${hour:=0} $min $sec
counter=$((hour*60**2 + min*60 + sec))

function PRINT_STATUS {
	local i="$1"
	h=$(( i / 3600 ))
	m=$(( (i - h*60) / 60 ))
	s=$(( i - h*60 - m*60 ))
	bar=$(( (${COLUMNS:-$(tput cols)}-43)*i/counter ))
	space=$(( (${COLUMNS:-$(tput cols)}-43) - bar))
	printf "\r\e[1;37m=== \e[0;37m%02d:%02d:%02d/%02d:%02d:%02d \e[1;37m===[" "$h" "$m" "$s" "$hour" "$min" "$sec"
	[[ "$bar" -gt 0 ]] && printf "%0.s*" $(seq 1 $bar)
	printf "%*s" $space
	printf "]=== %s ===" "$(date +%H:%M:%S)"
}

for i in $(seq 1 $counter); do
	PRINT_STATUS "$i" &
	sleep 1
done
echo ""

[[ -z "$silent" ]] &&
	echo -e "\e[0;37mCounter is over, press \e[1;33m<Ctrl>+C\e[0;37m to exit\e[0m" &&
	while true; do
	mplayer 3Xalarm.WAV &>/dev/null
	sleep 1
done
