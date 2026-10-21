#!/bin/bash
# Get the current layout
layout=$(setxkbmap -query | awk 'NR == 3 {print $2}')

# Toggle between layouts
if [[ $layout == "us" ]]; then
  setxkbmap -layout ara
elif [[ $layout == "ara" ]]; then
  setxkbmap -layout us
fi
