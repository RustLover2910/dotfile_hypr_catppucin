#!/usr/bin/env sh

keyup() {
  brightnessctl -d dell::kbd_backlight set +1
  keybright="$(brightnessctl -d dell::kbd_backlight g)"
  if [ "$keybright" = "0" ]; then
    dunstify " Backlight " " 0% " -i /home/archyboy/.local/share/icons/Tela-dracula-dark/symbolic/status/keyboard-brightness-symbolic.svg  -u normal -r 91190 -t 1000
  elif [ "$keybright" = "1" ]; then
    dunstify " Backlight " " 50% " -i /home/archyboy/.local/share/icons/Tela-dracula-dark/symbolic/status/keyboard-brightness-symbolic.svg -u normal -r 91190 -t 1000
  else 
    dunstify " Backlight " " 100% " -i /home/archyboy/.local/share/icons/Tela-dracula-dark/symbolic/status/keyboard-brightness-symbolic.svg -u normal -r 91190 -t 1000
  fi
}
downboard() {
  brightnessctl -d dell::kbd_backlight set 1-
  keybright="$(brightnessctl -d dell::kbd_backlight g)"
  if [ "$keybright" = "0" ]; then
    dunstify " Backlight " " 0% " -i /home/archyboy/.local/share/icons/Tela-dracula-dark/symbolic/status/keyboard-brightness-symbolic.svg -u normal -r 91190 -t 1000
  elif [ "$keybright" = "1" ]; then
    dunstify " Backlight " " 50% " -i /home/archyboy/.local/share/icons/Tela-dracula-dark/symbolic/status/keyboard-brightness-symbolic.svg -u normal -r 91190 -t 1000
  else 
    dunstify " Backlight " " 100% " -i /home/archyboy/.local/share/icons/Tela-dracula-dark/symbolic/status/keyboard-brightness-symbolic.svg -u normal -r 91190 -t 1000
  fi
}

case "$1" in 
  keyup) keyup;;
  downboard) downboard;;
esac
