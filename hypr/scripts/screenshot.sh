#!/usr/bin/env sh

picture_dir="$HOME/Pictures/screenshot"
save_file="$(date +'%y-%m-%d_%H-%M-%S_screenshot.png')"

screen() {
  grim $picture_dir/$save_file
  dunstify "Screenshot Captured!" -i /home/archyboy/.local/share/icons/Tela-dracula-dark/symbolic/actions/screenshot-recorded-symbolic.svg -u normal -r 91190 -t 1000
}
selects() {
  grim -g "$(slurp)" - | swappy -f - 
  dunstify "Screenshot Captured!" -i /home/archyboy/.local/share/icons/Tela-dracula-dark/symbolic/apps/screenshot-app-symbolic.svg -u normal -r 91190 -t 1000
}
case $1 in
  screen) screen;;
  select) selects;;
esac
