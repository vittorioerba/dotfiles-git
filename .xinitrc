#!/bin/sh

setxkbmap it

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then

xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then

xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# SET SECONDARY SCREEN
if xrandr | grep -q "^DP1 connected"; then
    xrandr --output eDP1 --primary --auto --output DP1 --auto --right-of eDP1
fi


# SSH AGENT
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets)
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
export SSH_AUTH_SOCK


#### BSPWM
exec bspwm

#### 2BWM

# feh --no-fehbg --bg-fill '/home/vittorio/Immagini/Tsunami_by_hokusai_19th_century.jpg' # wallpaper
# # sxhkd -c "$HOME/.config/sxhkd/bspwm_sxhkdrc"  &         # key manager
# picom -b &                                              # compositor
# nm-applet &                                             # connection
# volnoti &                                               # banner for volume control
# dunst &                                                 # notifications
# xautolock -locker "betterlockscreen -l" &               # lock screen after 10 mins
# udiskie --tray &                                        # auto-mount usb
# dropbox &                                               # cloud


# exec 2bwm
