# displays a friendly welcome message

# proceed only if shell interactivity flag is set
case "$-" in
  *i* )
    # proceed when not in ranger or tmux, non-root user
    [ -n "$RANGER_LEVEL" -o -n "$TMUX" -o $(id -u) -eq 0 ] && return ;;
  * ) return ;;
esac

# needs lolcat and toilet
[ -x /usr/games/lolcat ] && [ -x /usr/bin/toilet ] || return

if [ $LANG = "de_DE.UTF-8" ]
then
  echo "	( Taste [F1] zum umschalten )"
  { echo "KEINE PANIK"|toilet --filter border; echo "    Dies ist der Kommandozeilenmodus. Computer wartet auf deine Befehle."; } | lolcat
else
  echo "	( Press [F1] key to toggle )"
  { echo "don't panic"|toilet --filter border; echo "    This is the command line interface. Computer is waiting for your input."; } | lolcat
fi

echo
