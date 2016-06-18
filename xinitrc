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

xrdb -load ~/.Xresources
hsetroot -tile ~/Pictures/Wallpapers/summertilebg.png &
xsetroot -cursor_name left_ptr &
xflux -z 85308 -k 2800 &
compton --config ~/.config/compton.conf -b &
exec i3
