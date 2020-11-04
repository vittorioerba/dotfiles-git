#!/bin/bash

if [ -z "$@" ]; then
    # echo -en "Lock\0icon\x1fsystem-lock-screen\n"
    echo -en "Reload\0icon\x1fsystem-restart\n"
    echo -en "Restart\0icon\x1fsystem-log-out\n"
    echo -en "Exit\0icon\x1fsystem-shutdown\n"
else
    case "$1" in
        *Reload) i3-msg 'reload' > /dev/null;;
        *Restart) i3-msg 'restart'  > /dev/null;;
        *Exit) i3-msg 'exit'  > /dev/null;;
    esac
fi
