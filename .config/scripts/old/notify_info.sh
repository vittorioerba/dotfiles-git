#!/usr/bin/bash

SCRIPTS="$HOME/.config/scripts"

battery=$(source $SCRIPTS/battery.sh)
battery="Battery: $battery\%"

network=$(source $SCRIPTS/network.sh)
network="Network: $network"

timeDate=$(source $SCRIPTS/timeDate.sh)

volume=$(source $SCRIPTS/volume.sh)
volume=("Volume: $volume")

notify-send -u  "Low" "Status" "$(echo -e "$battery\n$network\n$timeDate\n$volume")" -t 3000
