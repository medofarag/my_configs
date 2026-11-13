#!/bin/bash

choice=$(zenity --question --switch --text="ColorPicker" \
               --extra-button="Cancel"\
               --extra-button="Pick a color from selector"\
               --extra-button="Pick a color from screen")

case $choice in
  "Pick a color from screen")
    hyprpicker | wl-copy;;
  "Pick a color from selector")
    pastel --color-picker zenity pick | pastel --color-picker zenity format | wl-copy;;
  *)
    exit;;
esac

