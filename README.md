# Vittorio Erba's configuration files

This repository is where I manage the configuration files (dotfiles) for my current installation of Arch Linux.
I manage the dotfiles using [Gnu Stow](https://www.gnu.org/software/stow/).

### Screenshots

TODO

## Installation notes

In this section, I collect what I learn about configuring Arch Linux.

Machine: Dell XPS 13 9370

## During install

- Remember to have efi partition formated in FAT32.
- Install "dialog" and "wpa_supplicant" to have wifi-menu on the new installation

## Post install

### time
Activate service https://wiki.archlinux.org/index.php/Systemd-timesyncd
to have synced clock with network

### Swap file

- Follow arch wiki from fallocate, commands before are for brtfs (or something like this) fils systems
- dd command for 8 GB: sudo dd if=/dev/zero of=/swapfile count=8192 bs=1MiB

### External USB

- see udisksctl mount/unmount -b "name of device"
- install udiskie

[OLD]

- Use this command to add username=vittorio to the disk group to use mount 
sudo usermod -a -G disk vittorio 

### Network

- use wifi-menu to set a connection
- install networkmanager, dhclient, nm-applet
- run nm-applet (needs panel with sys-tray) 
- in case of frequent disconnection, see https://bbs.archlinux.org/viewtopic.php?id=229808 and update firmware (select the latest firmware6 available)
- [OLD] use the profiles created by wifi-menu with netctl by enabling them, or enabling netctl-auto

### Printer

- install cups and system-config-printer (maybe you need drivers, in thath case I followed arch wiki section gutenprint

### Aur helper

- install yay following instruction

### Power management

- Install tlp
- Activate betterlockscreen service to lock on wake after suspend (see https://github.com/pavanjadhaw/betterlockscreen/pull/121#issuecomment-514880472 for better locking)
- [TODO] understand suspend on closing lid. At the moment, it works only after some minutes between each suspend.
- To hibernate, follow the arch wiki for hibernation on swapfile. The resume_offset does not want the two dots, to regenerate the initramfs use "mkincipio -p linux", reboot and it should work.

### Graphical System

- Install intel drivers + opengl (see archwiki)
- See this for tearing
- Install xorg-server
- Install xinit 

#### WM

- Follow archwiki for bspwm installation
- Install xwinfo to be able to set a fixed desktop for an app
- see for bspwm dynamic desktops: https://protesilaos.com/pdfd/advanced-bspwm/ and https://gitlab.com/protesilaos/dotfiles/blob/master/bin/bin/bspwm_dynamic_desktops
- [OLD] Install i3-gaps, i3status

#### FONT

- use Nerdfonts, such as
/usr/share/fonts/TTF/DejaVu-Sans-Mono-Nerd-Font-Complete-Mono.ttf: DejaVuSansMono Nerd Font Mono
- use https://www.nerdfonts.com/cheat-sheet to look for icons, get char code and look for it using "gucharmap" (select "view only this font")


#### VOLUME AND BRIGHTNESS

- Install and set up volnoti from AUR

#### PRINTER

- at unimi, install printmi and add in /etc/resolv.conf the line "search mi.infn.it"
- to prevent Netweork manager to overwrite resolv.conf, see "Unmanaged /etc/resolv.conf" in Network manager wiki, i.e. create /etc/NetwerokManager/conf.d/dns.conf with the text "[main] \n dns=none"

#### Menus (with rofi)

- [TODO] See https://www.reddit.com/r/unixporn/comments/cvqc6s/oc_handy_menus_made_with_rofi/ for custom menus, like powermenu etc

#### Lockscreen

- Install betterlockscreen
- Install xautolock and use it to suspend after x minutes TODO

#### Notifications

- Install notification-daemon, dunst, libnotify

### Cloud

- Install dropbox (aur)
- See archwiki to 
    - enable user service at startup
    - edit user service for systemtray
- Install rclone and set up remote filesystem for gdrive and onedrive
- install https://github.com/abraunegg/onedrive/blob/master/docs/USAGE.md sync and enable service. If a reauthorization is needed, stop service and run onedrive --synchronize

### Mathematica

- Needs "avahi"
- Needs that /usr/share/desktop-directories exsits (on Arch, create it by hand!)
- to use python 3.8 and mathematica 12.0 you must modify the file mentioned in https://mathematica.stackexchange.com/questions/211984/solved-externalevaluatepysys-pycmd-evaluates-to-failure

### Color picker

- Needs "xcolor"
- Install "pastel" on AUR

### Pass
- enpass is still much better on ios, sadly as pass is way more confortable on linx
- modify .gnupg/gpg-agent.conf to set default-cache-ttl X to set caching of gpg passwords for X seconds
- modify .gnupg/gpg-agent.conf to set the preferred pinentry program X to set caching of gpg passwords for X seconds
- to use ios app ssh key must be RSA and stuff... see wiki
- install qrencode and use the setting -Sv40 if keys are too long

### Default applications

- needs xdg-utils
- see /usr/share/applications for examples of .desktop files and for examples of mime format
- modify .config/mimeapps.list to add the defaults

### skype

- install skyperforlinux, gnome-keyring
- insert the following in xinitrc for keyring to work 
    eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
    source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
    export SSH_AUTH_SOCK

### 2bwm 
- to have focus on click of mouse at startup of 2bwm, add toggle_sloppy(""); in the main of 2bwm.c

## TODO

- move autostart to xinit (if possible, or where should I put them for wm agnostic thing?!)
- clean up alacritty config
- clean up dunst config
- clean up sxkhd config
- configure lightdm

- sign pdf http://emmanuel.branlard.free.fr/work/linux/dev/SignPDF/SignPDF

- on usability level, I need something like OSX preview

### WM

- I want a floating wm that can be controlled by sxkhd, with snap to halves, maybe tiling up to 3 windows, and tab cycle

### HIDE PANEL

> ~ xdo hide -a polybar-top_eDP1

> ~ xdo show -a polybar-top_eDP1

works with wm_name (see man xdo -a) retrievable with xprop + click on panel

