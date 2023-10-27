#!/usr/bin/env sh

get_volume="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>&1)"
volume="${get_volume: -4}"
max="1.0"
max_volume="0.95"
high="0.7"

up() {
  if [ $(bc <<< "$volume >= $max") -eq 1 ]
  then
    #echo "Full  Volume!"
    get_volume="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>&1)"
    volume="${get_volume//.}"
    dunstify -a "VOLUME" " Volume " " ${volume: -3}% " -i /home/archyboy/.local/share/icons/Tela-dracula-dark/16@2x/panel/audio-volume-high.svg -u normal -r 91190 -t 1000
elif [ $(bc <<< "$volume >= $max_volume ") -eq 1 ]
  then
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
    get_volume="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>&1)"
    volume="${get_volume//.}"
    dunstify -a "VOLUME" " Volume " " ${volume: -3}% " -i /home/archyboy/.local/share/icons/Tela-dracula-dark/16@2x/panel/audio-volume-high.svg -u normal -r 91190 -t 1000
  elif [ $(bc <<< "$volume >=  $high ") -eq 1 ]
  then
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
    get_volume="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>&1)"
    volume="${get_volume: -2}"
    dunstify -a "VOLUME" " Volume " " $volume% " -i /home/archyboy/.local/share/icons/Tela-dracula-dark/16@2x/panel/audio-volume-high.svg -u normal -r 91190 -t 1000
  elif [ $(bc <<< "$volume >= "0.4" ") -eq 1 ]
  then
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
    get_volume="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>&1)"
    volume="${get_volume: -2}"
    dunstify -a "VOLUME" " Volume " " $volume% " -i /home/archyboy/.local/share/icons/Tela-dracula-dark/16@2x/panel/audio-volume-medium.svg -u normal -r 91190 -t 1000
  elif muted_or_not
  then
    dunstify -a "VOLUME" "Muted" -i /home/archyboy/.local/share/icons/Tela-dracula-dark/16@2x/panel/audio-volume-muted.svg -u normal -r 91190 -t 1000
  else
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
    get_volume="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>&1)"
    volume="${get_volume: -2}"
    dunstify -a "VOLUME" " Volume " " $volume% " -i /home/archyboy/.local/share/icons/Tela-dracula-dark/16@2x/panel/audio-volume-low.svg -u normal -r 91190 -t 1000
  fi
}

down() {
  if [ $(bc <<< "$volume >=  $high ") -eq 1 ]
  then
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
    get_volume="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>&1)"
    volume="${get_volume//.}"
    dunstify -a "VOLUME" " Volume " " ${volume: -2}% " -i /home/archyboy/.local/share/icons/Tela-dracula-dark/16@2x/panel/audio-volume-high.svg  -u normal -r 91190 -t 1000
  elif [ $(bc <<< "$volume >= "0.4" ") -eq 1 ]
  then
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
    get_volume="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>&1)"
    volume="${get_volume//.}"
    dunstify -a "VOLUME" " Volume " " ${volume: -2}% " -i /home/archyboy/.local/share/icons/Tela-dracula-dark/16@2x/panel/audio-volume-medium.svg -u normal -r 91190 -t 1000
  elif muted_or_not
  then
    dunstify -a "VOLUME" "Muted" -i /home/archyboy/.local/share/icons/Tela-dracula-dark/16@2x/panel/audio-volume-muted.svg -u normal -r 91190 -t 1000
  else
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
    get_volume="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>&1)"
    volume="${get_volume: -2}"
    dunstify -a "VOLUME" " Volume " " $volume% " -i /home/archyboy/.local/share/icons/Tela-dracula-dark/16@2x/panel/audio-volume-low.svg -u normal -r 91190 -t 1000
  fi
}

mute() {
  if muted_or_not
  then
    wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
    dunstify -a "VOLUME" "Unmuted" -i /home/archyboy/.local/share/icons/Tela-dracula-dark/16@2x/panel/audio-volume-high.svg -u normal -r 91190 -t 1000
  else
    wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
    dunstify -a "VOLUME" "Muted" -i /home/archyboy/.local/share/icons/Tela-dracula-dark/16@2x/panel/audio-volume-muted.svg -u normal -r 91190 -t 1000
  fi
}

muted_or_not() {
  get_volume="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>&1)"
  volume="${get_volume: -6}"
  if [ "${volume//]}" = "MUTED" ]
  then
    return 0
  else 
    return 1
  fi
}

case "$1" in
  up) up;;
  down) down;;
  mute) mute;;
esac

