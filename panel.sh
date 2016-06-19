#! /usr/bin/zsh

PANEL_FIFO=/tmp/panel-fifo
PANEL_HEIGHT=16
PANEL_FONT_FAMILY="neep:size=6"
ICON_FONT="siji:size=8"

if [ $(pgrep -cx panel) -gt 1 ] ; then
	printf "%s\n" "The panel is already running." >&2
	exit 1
fi

trap 'trap - TERM; kill 0' INT TERM QUIT EXIT

[ -e "$PANEL_FIFO" ] && rm "$PANEL_FIFO"
mkfifo "$PANEL_FIFO"

bspc config top_padding $PANEL_HEIGHT
bspc subscribe > "$PANEL_FIFO" &
xtitle -sf 'T%s' > "$PANEL_FIFO" &

# Clock
while true;
	do
		echo 'C\ue1b9' $(date +"%l:%M %p");
	sleep 5;
done > "$PANEL_FIFO" &

# Date
while true;
do echo 'D\ue225' $(date +'%a %b %d')
	sleep 5
done > $PANEL_FIFO &

# Battery
while true;
do
BATT_LEVEL=$(acpi -b | grep -o '[[:digit:]]\+%' | sed 's/%//')
	if [ $BATT_LEVEL -ge 80 ]
		then
			echo 'B\ue23d' $BATT_LEVEL%
	fi

	if [ $BATT_LEVEL -ge 60 -a $BATT_LEVEL -lt 80 ]
		then
			echo 'B\ue23d' $BATT_LEVEL%
	fi

	if [ $BATT_LEVEL -ge 40 -a $BATT_LEVEL -lt 60 ]
		then
			echo 'B\ue23c' $BATT_LEVEL%
	fi

	if [ $BATT_LEVEL -ge 20 -a $BATT_LEVEL -lt 40 ]
		then
			echo 'B\ue23c' $BATT_LEVEL%
	fi

	if [ $BATT_LEVEL -lt 20 ]
		then
			echo 'B%{T3}\ue23b%{T1}' $BATT_LEVEL%
	fi
	sleep 30;
done > "$PANEL_FIFO" &

# Alsa volume
while true;
do
ALSA_VOLUME=$(amixer get Master | grep 'Front Left: Playback' | grep -o '...%' | sed 's/\[//' | sed 's/%//' | sed 's/ //')
ALSA_STATE=$(amixer get Master | grep 'Front Left: Playback' | grep -o '\[on]')

if [ $ALSA_STATE ]
then
	if [ $ALSA_VOLUME -ge 30 ]
	then
		echo V'\ue050' $ALSA_VOLUME
	fi
	if [ $ALSA_VOLUME -gt 0 -a $ALSA_VOLUME -lt 30 ]
	then
		echo V'\ue04e' $ALSA_VOLUME
	fi
	if [ $ALSA_VOLUME -eq 0 ]
	then
		echo V'\ue04e' $ALSA_VOLUME
	fi
	else
		echo V'\ue04f' $ALSA_VOLUME
	fi
	sleep 0.1
done > $PANEL_FIFO &


# Wifi
while true;
do
WIFI_SSID=$(iw wlp2s0 link | grep 'SSID' | sed 's/SSID: //' | sed 's/\t//')
	echo L'\ue0f3' $WIFI_SSID
	sleep 10
done > $PANEL_FIFO &

# Power
echo P'\ue10c' > $PANEL_FIFO &

# # music controls
# while true;
# do
# 	SONG_NAME=$(mpc | head -n1)
# 	if [[ -n $(mpc status | grep paused) ]]
# 	then
# 		echo "R%{T3}%{A:mpc prev:}\uf19c%{A} %{A:mpc play:}\uf198%{A}  %{A:mpc next:}\uf17c%{A}%{T1} $SONG_NAME"
# 	else
# 		echo "R%{T3}%{A:mpc prev:}\uf19c%{A} %{A:mpc pause:}\uf191%{A} %{A:mpc next:}\uf17c%{A}%{T1} $SONG_NAME"
# 	fi
#
# 	sleep 1
# done > $PANEL_FIFO &


. ~/panel_colors

cat "$PANEL_FIFO" | ~/panel_bar | lemonbar -g x$PANEL_HEIGHT -f "$PANEL_FONT_FAMILY" -f "$ICON_FONT" -F "$COLOR_FOREGROUND" -B "$COLOR_BACKGROUND" -u 2 -p | zsh &

wait
