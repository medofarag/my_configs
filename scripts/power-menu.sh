#!/bin/bash

# عرض القائمة باستخدام fuzzel، وإخراج الخيار المحدد
choice=$(printf "Poweroff\nRestart\nSleep\nLogout" | fuzzel --dmenu -p "choose: ")

# تنفيذ الأمر المقابل بناءً على الاختيار
case "$choice" in
    "Poweroff") systemctl poweroff ;;
    "Restart") systemctl reboot ;;
    "Sleep") systemctl suspend ;;
    "Logout") loginctl terminate-user "$USER" ;; # أو استخدم الأمر المقابل لـ Sway/Hyprland
esac
