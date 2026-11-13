#!/bin/bash

filename=screenshot_$(date +%Y-%m-%d_%H-%M-%S).png
 
mkdir -p ~/.cache/screenshot-script/

region=$(slurp) || exit 0

grim -g "$region" ~/.cache/screenshot-script/$filename

choice=$(zenity --question --switch --text="ColorPicker" \
               --extra-button="Cancel"\
               --extra-button="Save"\
               --extra-button="Edit"\
               --extra-button="Copy")

case $choice in
  "Save")
    if [ ! -d ~/Pictures/Screenshots ]; then
      mkdir -p ~/Pictures/Screenshots
    fi
    mv ~/.cache/screenshot-script/$filename ~/Pictures/Screenshots
    notify-send "screenshot saved as $filename";;
  "Edit")
    if [ ! command -v pinta &> /dev/null ]; then
      zenity --error --text="pinta is not installed"
      exit
    else
      pinta ~/.cache/screenshot-script/$filename
      mv ~/.cache/screenshot-script/$filename ~/Pictures/Screenshots
    fi
    exit;;
  "Copy")
    wl-copy --type image/png < ~/.cache/screenshot-script/$filename;;
  *)
    exit;;
esac

