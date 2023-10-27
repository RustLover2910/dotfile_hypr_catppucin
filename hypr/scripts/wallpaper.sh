#!/usr/bin/zsh

next() {
  wpaperctl next-wallpaper
}

pre() {
  wpaperctl previous-wallpaper
}

case "$1" in 
  next) next;;
  pre)  pre;;
esac
