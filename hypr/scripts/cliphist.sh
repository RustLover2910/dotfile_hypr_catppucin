#!/usr/bin/env sh
rofi=/home/archyboy/.config/rofi/launchers/type-2/style-2.rasi

cliphist list | rofi -dmenu -theme ${rofi} | cliphist decode | wl-copy 

