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
    dunstify -a "VOLUME" " Volume " " ${volume: -3}% " -i /usr/share/icons/breeze-dark/status/16/audio-volume-high.svg -u normal -r 91190 -t 1000
elif [ $(bc <<< "$volume >= $max_volume ") -eq 1 ]
  then
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
    get_volume="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>&1)"
    volume="${get_volume//.}"
    dunstify -a "VOLUME" " Volume " " ${volume: -3}% " -i /usr/share/icons/breeze-dark/status/16/audio-volume-high.svg -u normal -r 91190 -t 1000
  elif [ $(bc <<< "$volume >=  $high ") -eq 1 ]
  then
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
    get_volume="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>&1)"
    volume="${get_volume: -2}"
    dunstify -a "VOLUME" " Volume " " $volume% " -i /usr/share/icons/breeze-dark/status/16/audio-volume-high.svg -u normal -r 91190 -t 1000
  elif [ $(bc <<< "$volume >= "0.4" ") -eq 1 ]
  then
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
    get_volume="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>&1)"
    volume="${get_volume: -2}"
    dunstify -a "VOLUME" " Volume " " $volume% " -i /usr/share/icons/breeze-dark/status/16/audio-volume-medium.svg -u normal -r 91190 -t 1000
  else
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
    get_volume="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>&1)"
    volume="${get_volume: -2}"
    dunstify -a "VOLUME" " Volume " " $volume% " -i /usr/share/icons/breeze-dark/status/16/audio-volume-low.svg -u normal -r 91190 -t 1000
  fi
}

down() {
  if [ $(bc <<< "$volume >=  $high ") -eq 1 ]
  then
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
    get_volume="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>&1)"
    volume="${get_volume//.}"
    dunstify -a "VOLUME" " Volume " " ${volume: -2}% " -i /usr/share/icons/breeze-dark/status/16/audio-volume-high.svg -u normal -r 91190 -t 1000
  elif [ $(bc <<< "$volume >= "0.4" ") -eq 1 ]
  then
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
    get_volume="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>&1)"
    volume="${get_volume//.}"
    dunstify -a "VOLUME" " Volume " " ${volume: -2}% " -i /usr/share/icons/breeze-dark/status/16/audio-volume-medium.svg -u normal -r 91190 -t 1000
  else
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
    get_volume="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>&1)"
    volume="${get_volume: -2}"
    dunstify -a "VOLUME" " Volume " " $volume% " -i /usr/share/icons/breeze-dark/status/16/audio-volume-low.svg -u normal -r 91190 -t 1000
  fi
}


mute() {
  get_volume="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>&1)"
  volume="${get_volume: -6}"
  wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
  if [ "${volume//]}" = "MUTED" ]
  then
    dunstify -a "VOLUME" "Unmuted" -i /usr/share/icons/breeze-dark/status/16/audio-volume-high.svg -u normal -r 91190 -t 1000
  else
    dunstify -a "VOLUME" "Muted" -i /usr/share/icons/breeze-dark/status/22/audio-volume-muted.svg -u normal -r 91190 -t 1000
  fi
}

case "$1" in
  up) up;;
  down) down;;
  mute) mute;;
esac

