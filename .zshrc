#################################################################
# ZSHRC configuration
#################################################################
#
# This configuration file is the only file that needs to be sourced from the homedir .zshrc to configure the zsh shell.
# It contains general settings, and sources other files for program specific settings and aliases
# Remember not to commit to git the zgen directory, it's useless.
#################################################################
# configuration utilities
alias shconf="source $HOME/.zshrc"

# SCRIPTDIR="$HOME/.config/scripts"
# CONFIGDIR="$HOME/dotfiles"
# ZSHDIR="$CONFIGDIR/zsh"
# VIMDIR="$CONFIGDIR/nvim"

export EDITOR="vim"
#################################################################
# PATH
export PATH=$PATH:$HOME/.local/bin:$HOME/.gem/ruby/2.6.0/bin:$HOME/.config/scripts
fpath=($HOME/.config/scripts $fpath)
#################################################################
# XDG
XDG_CONFIG_HOME="$HOME/.config"
export XDG_CONFIG_HOME
#################################################################
# input

	# https://github.com/beefsack/zsh-simplicity
# stty -ixon
# bindkey -e
# bindkey "${terminfo[khome]}" beginning-of-line
# bindkey "${terminfo[kend]}" end-of-line
# bindkey "${terminfo[kich1]}" overwrite-mode
# bindkey "${terminfo[kdch1]}" delete-char
# bindkey "${terminfo[kcuu1]}" up-line-or-history
# bindkey "${terminfo[kcud1]}" down-line-or-history
# bindkey "${terminfo[kcub1]}" backward-char
# bindkey "${terminfo[kcuf1]}" forward-char

# bindkey -v
# export KEYTIMEOUT=1

#################################################################
# autocompletion

	# Tab completions
autoload -U compinit && compinit        

	# see hidden files in autocompletion
setopt globdots                         
	
	# Completion to include menu selection, case insensitive and match in words
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list     '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'

#################################################################
# history

	# https://github.com/beefsack/zsh-simplicity
export HISTSIZE=2000
export HISTFILE="$HOME/.zsh_history"
export SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups
setopt hist_ignore_space

    # incremental pattern search in history
    # when changing terminal, get in it, type Ctrl+Up and Ctrl+Down; these strings are those needed in the following commands
bindkey '[A' history-beginning-search-backward
bindkey '[B' history-beginning-search-forward
#################################################################
# PROMPT
# function zle-line-init zle-keymap-select {
#     RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
#     RPS2=$RPS1
#     zle reset-prompt
# }
# zle -N zle-line-init
# zle -N zle-keymap-select
#################################################################
# plugins
	# load zgen
source "$HOME/.zgen/zgen.zsh"

	# load plugins
zgen load zsh-users/zsh-autosuggestions
zgen load mafredri/zsh-async
zgen load DFurnes/purer
zgen load zsh-users/zsh-syntax-highlighting
#zgen load b4b4r07/enhancd init.sh

	# config: purer
PURE_PROMPT_SYMBOL_COLOR="ffffff"
PURE_PROMPT_SYMBOL=">"
#################################################################
# Better Core Commands
alias cl='clear'
alias cdh='cd $HOME && clear'
alias lsa='ls -alh --color=auto'

# using fzf to cd
# see more here: https://github.com/junegunn/fzf/wiki/Examples#changing-directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

alias batst='upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "state|time\ to|percentage"'
alias curWS='xprop -root -notype  _NET_CURRENT_DESKTOP | cut -d "=" -f 2 | cut -d " " -f 2'

alias brightUp='light -A 5'
alias brightDown='light -U 5'

alias vim='nvim'
alias enpass='/opt/enpass/Enpass'
alias xopen='xdg-open'

alias c17="c++ -std=c++17 -march=native -O2 -funroll-all-loops"

vimtex() {
    nvim $1.tex
}

#git add commit push origin master
gitom () {
        git add .
        git commit -m "$1"
        git push origin master
}

rc(){
	systemctl list-unit-files --type=service |\
	sed 's/.service//g' |\
	sed '/static/d' |\
	sed '/indirect/d' |\
	sed '/systemd/d' |\
	sed '/dbus-org/d' |\
	sed '/canberra/d'|\
	sed '/wpa_supplicant/d' |\
	sed '/netctl/d' |\
	sed '/rfkill/d' |\
	sed '/krb5/d' |\
	tail -n+2 |\
	head -n -2 |\
	sed 's/\(^.*enabled.*$\)/[x] \1/' |\
	sed 's/enabled//g' |\
	sed 's/\(^.*disabled.*$\)/[ ] \1/' |\
	sed 's/disabled//g' |\
	sed 's/[ \t]*$//' |\
	while read line; do
			if [[ $line == *'[x]'* ]]; then
				printf "\033[0;32m$line\n"
			else
				printf "\033[1;30m$line\n"
			fi
	done
}

n_info(){
    title="System informations"
    line="BAT: $(batst | grep "percentage" | cut -d ":" -f 2 | xargs)\n$(date '+%d/%m/%Y | %H:%M')"
    notify-send $title $line -t 2000
}
#################################################################
# Ledger
LEDGER_PATH="$HOME/Cloud/Github/ledger/"
LEDGER_FILE="$LEDGER_PATH/current.ledger"
alias hl='hledger -f $LEDGER_FILE'
alias hlr='hledger -f $LEDGER_FILE register'
alias hlb='hledger -f $LEDGER_FILE balance'
alias hla='hledger -f $LEDGER_FILE balance patrimonio'
#alias hlei='hledger -f $LEDGER_FILE balance income expenses not:mom not:income:regali -M -A -T'
#alias hlpa='hledger -f $LEDGER_FILE balance pending anticipated not:mom not:income:regali -M -A -T'
#alias hlmom='hledger -f $LEDGER_FILE balance mom --depth 2'
# alias hltm='hledger -f $LEDGER_FILE balance income expenses not:mom not:travel not:income:regali  --depth 2 -p thismonth'
alias hlvim='nvim $LEDGER_FILE'
#alias hlsum='hlei && hlpa'
alias hlm='hledger -f $LEDGER_FILE balance not:patrimonio not:equity --depth 2 -p "from 2018/11/01" -M'
# alias hlmq='hledger -f $LEDGER_FILE balance not:patrimonio not:equity --depth 2 -p "from last quarter to next quarter" -M -A -T'
alias hlp='hledger -f $LEDGER_FILE patrimonio -p "to thismonth" -MH --depth 1 --no-total --value=now,eur'

hlmq() {
    startdate=$(date --date='-5 month' +'%Y/%m')
    enddate=$(date --date='+2 month' +'%Y/%m')
    echo "Bilancio entrate-uscite | Viaggi esclusi "
    echo "\n"
    hledger -f $LEDGER_FILE balance uscite entrate not:viaggi  --depth 2 -p "from $startdate to $enddate" -M -T $@
    echo "\n"
    echo "Bilancio debiti/crediti con persone"
    echo "\n"
    hledger -f $LEDGER_FILE balance people --depth 2 -p "from $startdate to $enddate" -M -T $@
    echo "\n"
    echo "Bilancio entrate-uscite | Viaggi "
    echo "\n"
    hledger -f $LEDGER_FILE balance not:patrimonio not:equity viaggi --depth 2 -p "from $startdate to $enddate" -M -T $@
    echo "\n"
}


add() {
  echo "Syncing..."
  git -C $LEDGER_PATH pull
  hledger add -f $LEDGER_FILE
  echo "Syncing..."
  git -C $LEDGER_PATH add $LEDGER_FILE
  git -C $LEDGER_PATH commit -m "update"
  git -C $LEDGER_PATH push origin master
  clear
}
#################################################################
#DOTFILES
#https://www.anand-iyer.com/blog/2018/a-simpler-way-to-manage-your-dotfiles.html
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
#################################################################
#################################################################
#PAPIS
# eval "$(_PAPIS_COMPLETE=source_zsh papis)"
#################################################################
# RCLONE
#
alias connect_onedrive="rclone --vfs-cache-mode writes mount onedrive: ~/Cloud/rc_Onedrive_rc"
alias connect_gdrive="rclone --vfs-cache-mode writes mount gdrive: ~/Cloud/rc_gDrive_rc"

#################################################################
# JUPYTERLAB
export JUPYTERLAB_DIR=$HOME/.local/share/jupyter/lab

#################################################################
# NOTES
#################################################################
note() {
    OUTPUT="$HOME/Cloud/OneDrive/notes/notes.txt"
    if [ ! -z ${1+x} ]
    then
        echo "- $(date +"%Y/%m/%d %H:%M:%S"): $@"  >> $OUTPUT
    else
        cat $OUTPUT
    fi
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

