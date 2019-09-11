# Check for interactive bash and that we haven't already been sourced.
[ -z "$BASH_VERSION" -o -z "$PS1" -o -n "$TMUX" -o -n "$SHELL_AUTOSTART" ] && return
SHELL_AUTOSTART=1

# depends on color script
COLOR_CYAN=$(color bold cyan)
COLOR_OFF=$(color off)

MSG="${COLOR_CYAN}Within 10 seconds${COLOR_OFF}, press "
[ $(id -u) -eq 0 ] || MSG+="${COLOR_CYAN}[s]${COLOR_OFF} for a root shell, "
MSG+="${COLOR_CYAN}[r]${COLOR_OFF} for ranger file browser or ${COLOR_CYAN}[t]${COLOR_OFF} to enter tmux terminal multiplexer or ${COLOR_CYAN}[any other key]${COLOR_OFF} to continue..$(color off)"

[ $(id -u) -eq 0 ] || { echo "don't panic"|toilet; echo "    This is the command line interface. Computer is waiting for your input."; }|lolcat --animate --speed=120
echo
if read -sn1 -t10 -sp "$MSG"; then
  case $REPLY in
    s) echo; [ $(id -u) -eq 0 ] || sudo su -l;;
    r) echo; ranger;;
    t) echo; tmux -2 attach-session;;
  esac
else
  echo
  echo "No key pressed.."
fi
echo
