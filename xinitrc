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
<<<<<<< HEAD
hsetroot -tile ~/Pictures/Wallpapers/summertilebg.png &
xsetroot -cursor_name left_ptr &
=======
hsetroot -tile ~/Pictures/Wallapers/summertilebg.png &
>>>>>>> 287481fec11478cdc438504cf47eb2a851cae777
xflux -z 85308 -k 2800 &
compton --config ~/.config/compton.conf -b &
exec i3
