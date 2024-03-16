#!/bin/bash

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?* ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

export XDG_SESSION_TYPE=x11


xrdb $HOME/.Xresources

session="openbox"
case $session in
    i3|i3wm) exec i3;;
    openbox) exec openbox-session;;
    xmonad)  exec xmonad;;
    gnome)   exec gnome-session;;
    mate)    exec mate-session;;
    budgie)  exec budgie-desktop;;
    *)       exec $1;;
esac
