#!/usr/bin/env sh

up() {
    busctl --user -- call rs.wl-gammarelay / rs.wl.gammarelay UpdateTemperature n +100
}

down() {
    busctl --user -- call rs.wl-gammarelay / rs.wl.gammarelay UpdateTemperature n -100
}

case "$1" in 
    up) up;;
    down) down;;
esac
#dunstify -a "" "Increasing to ${volume: 2}%" -u normal -r 91190 -t 1000
#busctl --user -- call rs.wl-gammarelay / rs.wl.gammarelay UpdateTemperature n +100

