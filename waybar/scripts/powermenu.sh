#!/bin/bash

choice=$(zenity --question --switch --text="PowerMenu" \
               --extra-button="Cancel"\
               --extra-button="Reboot"\
               --extra-button="Poweroff")

case "$choice" in
  "Poweroff")
    systemctl poweroff;;
  "Reboot")
    systemctl reboot;;
  "Cancel" | "")
    exit;;
  *)
    exit;;
esac
