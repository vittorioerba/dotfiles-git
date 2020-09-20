#!/bin/bash

# rofi_command="rofi -theme themes/powermenu.rasi"
rofi_command="rofi"

### Options ###
power_off="Shut down"
reboot="Reboot"
lock="Lock"
suspend="Suspend"
hibernate="Hibernate"
# Variable passed to rofi
options="$power_off\n$reboot\n$lock\n$suspend\n$hibernate"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 0)"
case $chosen in
    $power_off)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $lock)
        betterlockscreen -l dim
        ;;
    $suspend)
        amixer set Master mute
        systemctl suspend
        ;;
    $hibernate)
        systemctl hibernate
        ;;
esac


