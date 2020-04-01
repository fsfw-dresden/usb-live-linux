# proceed only if shell interactivity flag is set
case "$-" in
  *i* )
    # proceed when not in ranger or tmux and not sourced
    [ -n "$RANGER_LEVEL" -o -n "$TMUX" -o -n "$SHELL_AUTOSTART" ] && return ;;
  * ) return ;;
esac

export SHELL_AUTOSTART=1

# depends on /usr/local/bin/color
COLOR_CYAN=$(color bold cyan)
COLOR_RED=$(color bold red)
COLOR_OFF=$(color off)

[ $(id -u) -eq 0 ] && SU=1 || SU=
[ -e /etc/sudoers.d/live ] && SUDO="sudo" || SUDO=

MSG="Command line quick-start menu"
[ -z $SU ] || MSG+=" -- ${COLOR_RED}superuser / system administration mode${COLOR_OFF} active"
MSG+="\n-----------------------------\n"
MSG+=" Press \n\t"
MSG+="${COLOR_CYAN}[r]${COLOR_OFF}\t\t for ranger file browser, \n\t${COLOR_CYAN}[t]${COLOR_OFF}\t\t to enter tmux terminal multiplexer"
[ -z $SU ] && MSG+=", \n\t${COLOR_CYAN}[s]${COLOR_OFF}\t\t for a superuser / root shell"
MSG+=" or \n\t${COLOR_CYAN}[any other key]${COLOR_OFF}\t to continue to a regular Bash shell prompt..$(color off)"

ADIOS="\n\n\t... Happy Hacking! : )\n"

echo
if read -sn1 -sp "$(echo -e $MSG)"; then
  case $REPLY in
    s) echo; [ $(id -u) -eq 0 ] || ${SUDO} su -lw DISPLAY,XAUTHORITY,DBUS_SESSION_BUS_ADDRESS,SESSION_MANAGER,SSH_AUTH_SOCK;;
    r) echo -e "$ADIOS"; ranger;;
    t) echo -e "$ADIOS"; tmux -2 attach-session;;
    *) echo -e "$ADIOS";;
  esac
  echo
else
  echo "No key pressed.."
fi
