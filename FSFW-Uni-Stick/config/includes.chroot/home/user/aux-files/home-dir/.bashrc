# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi



# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# make bash autocomplete with up arrow
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward' # down arrow


# Huebscherer Prompt (Einabeaufforderungszeile)
# farbig, mit Datum und mit username



export PS1="\[\e[32;1m\]\u \t \n\w\n\[\e[31;1m\]> \[\e[0m\]"
# fuer Benutzer root in roter farbe 
#export PS1="\[\e[31;1m\]\u \t \n\w\n\[\e[31;1m\]> \[\e[0m\]"
# (bzw. purple)
#export PS1="\[\e[1;35;1m\]\u \t \n\w\n\[\e[31;1m\]> \[\e[0m\]"




