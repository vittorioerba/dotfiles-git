#!/bin/bash

if [ -z "$@" ]; then
    # echo -en "Lock\0icon\x1fsystem-lock-screen\n"
    echo -en "Suspend\0icon\x1fsystem-suspend\n"
    echo -en "Shutdown\0icon\x1fsystem-shutdown\n"
    echo -en "Reboot\0icon\x1fsystem-restart\n"
    # echo -en "Logout\0icon\x1fsystem-log-out\n"
    echo -en "Hibernate\0icon\x1fsystem-suspend-hibernate\n"
else
    case "$1" in
        # *Lock) lock ;;
        # *Logout) bspc quit ;;
        *Suspend) systemctl suspend ;;
        *Hibernate) systemctl hibernate ;;
        *Reboot) systemctl reboot ;;
        *Shutdown) systemctl poweroff ;;
    esac
fi
