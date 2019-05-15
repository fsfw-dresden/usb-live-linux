# Check for interactive bash and that we haven't already been sourced.
[ -z "$BASH_VERSION" -o -z "$PS1" -o -n "$TMUX" ] && return

if read -sn1 -t2 -sp "$(color bold yellow red)Within 2 seconds, press [s] for a root shell or [any] other key to enter tmux$(color off)"; then
  case $REPLY in
    s) echo; su;;
    *) echo; tmux -2 attach-session;;
  esac
fi
echo
