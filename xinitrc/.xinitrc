#!/bin/sh

xmodmap ~/.Xmodmap
xsetroot -grey

udiskie --no-notify --quiet &
autocutsel -selection PRIMARY -fork &
autocutsel -selection CLIPBOARD -fork &

exec i3
