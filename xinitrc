#		                             __                   
#		           __            __ /\ \__                
#		    __  _ /\_\     ___  /\_\\ \ ,_\  _ __   ___   
#		   /\ \/'\\/\ \  /' _ `\\/\ \\ \ \/ /\`'__\/'___\ 
#		 __\/>  </ \ \ \ /\ \/\ \\ \ \\ \ \_\ \ \//\ \__/ 
#		/\_\/\_/\_\ \ \_\\ \_\ \_\\ \_\\ \__\\ \_\\ \____\
#		\/_/\//\/_/  \/_/ \/_/\/_/ \/_/ \/__/ \/_/ \/____/

#!/bin/sh
#

$HOME/.monicarc   #monitor calibration

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

# Self-explanitory
xrdb -load ~/.Xresources

# Load custom keymapping
if [ -s ~/.Xmodmap ]; then
		xmodmap ~/.Xmodmap
fi

# Set wallpaper and bar
hsetroot -fill ~/pic/wallpapers/chicago3.jpg &

# Hide the mouse after a period of inactivity
unclutter -idle 2 &

# Mouse
xsetroot -cursor_name left_ptr &

# Xflux (for night-time coding)
xflux -z 85308 -k 2800 &

# Shadows
compton --config ~/.config/compton.conf -b &

# MPD daemon start (if no other user instance exists)
[ ! -s ~/.mpd/mpd.pid ] && mpd &
# MPDas daemon start
[[ -z $(pgrep -xU $UID mpdas) ]] && mpdas &

# WM of choice
sxhkd &
exec bspwm
#exec i3
