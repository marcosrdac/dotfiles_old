#!/bin/sh

#
# ~/.xsession
#

# import resources
[ -f ~/.config/Xresources/main ] && xrdb -I"$HOME" $HOME/.config/Xresources/main
dunst_start &

# disable beep
xset b off

found=0
tryDM() {
    if [ $found -eq 0 ]; then
        parameters=''
        case $1 in
            i3|i3wm           ) executable=i3;;
            bspwm             ) executable=bspwm;;
            dwm               ) executable=dwm;;
            awesome           ) executable=awesome;;
            catwm             ) executable=catwm;;
            cinnamon          ) executable=cinnamon-session;;
            enlightenment     ) executable=enlightenment_start;;
            ede               ) executable=startede;;
            fluxbox           ) executable=startfluxbox;;
            gnome             ) executable=gnome-session;;
            gnome-classic     ) executable=gnome-session; parameters="--session=gnome-classic";;
            icewm             ) executable=icewm-session;;
            jwm               ) executable=jwm;;
            kde               ) executable=startkde;;
            mate              ) executable=mate-session;;
            monster|monsterwm ) executable=monsterwm;;
            notion            ) executable=notion;;
            openbox           ) executable=openbox-session;;
            unity             ) executable=unity;;
            xfce|xfce4        ) executable=startxfce4;;
            xmonad            ) executable=xmonad;;
            *) executable=$1;;
        esac
        if command -v "$executable"
        then
            found=1
            exec "$executable" $parameters
        fi
    fi
}

if [ -n "$1" ]
then
    tryDM "$1"
fi

tryDM i3
tryDM bspwm
tryDM dwm
tryDM xfce4
tryDM mate
tryDM gnome
tryDM kde
