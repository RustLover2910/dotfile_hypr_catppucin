#!/usr/bin/env sh
up() {
  brightnessctl s 5%+
  brightness_raw=$(brightnessctl get)
  brightness="$( expr $brightness_raw / 960 )"
  if [ $(bc <<< "$brightness >= 70 ") -eq 1 ]
  then
    dunstify -a "Backlight" " Brightness " " $brightness% " -i /home/archyboy/.local/share/icons/Tela-dracula-dark/symbolic/status/display-brightness-high-symbolic.svg -u normal -r 91190 -t 1000
  elif [ $(bc <<< "$brightness >= 40 ") -eq 1 ]
  then
    dunstify -a "Backlight" " Brightness " " $brightness% " -i /home/archyboy/.local/share/icons/Tela-dracula-dark/symbolic/status/display-brightness-medium-symbolic.svg -u normal -r 91190 -t 1000
  else 
    dunstify -a "Backlight" " Brightness " " $brightness% " -i /home/archyboy/.local/share/icons/Tela-dracula-dark/symbolic/status/display-brightness-low-symbolic.svg -u normal -r 91190 -t 1000
  fi
}

down() {
  brightnessctl s 5%-
  brightness_raw=$(brightnessctl get)
  brightness="$( expr $brightness_raw / 960 )"
if [ $(bc <<< "$brightness >= 70 ") -eq 1 ]
  then
    dunstify -a "Backlight" " Brightness " " $brightness% " -i /home/archyboy/.local/share/icons/Tela-dracula-dark/symbolic/status/display-brightness-high-symbolic.svg -u normal -r 91190 -t 1000
  elif [ $(bc <<< "$brightness >= 40 ") -eq 1 ]
  then
    dunstify -a "Backlight" " Brightness " " $brightness% " -i /home/archyboy/.local/share/icons/Tela-dracula-dark/symbolic/status/display-brightness-medium-symbolic.svg -u normal -r 91190 -t 1000
  else 
    dunstify -a "Backlight" " Brightness " " $brightness% " -i /home/archyboy/.local/share/icons/Tela-dracula-dark/symbolic/status/display-brightness-low-symbolic.svg -u normal -r 91190 -t 1000
  fi
}

case "$1" in 
  up) up;;
  down) down;;
esac
#dunstify -a "" "Increasing to ${volume: 2}%" -u normal -r 91190 -t 1000

