# displays a friendly welcome message

# proceed only if shell interactivity flag is set
case "$-" in
  *i* )
    # proceed when not in ranger or tmux, non-root user
    [ -n "$RANGER_LEVEL" -o -n "$TMUX" -o $(id -u) -eq 0 ] && return ;;
  * ) return ;;
esac

# needs lolcat and toilet
[ -x /usr/games/lolcat ] && [ -x /usr/bin/toilet ] || exit

if [ $LANG = "de_DE.UTF-8" ]
then
  { echo "KEINE PANIK"|toilet --filter border; echo "    Dies ist der Kommandozeilenmodus. Computer wartet auf deine Befehle."; } | lolcat --animate --speed=120
else
  { echo "don't panic"|toilet --filter border; echo "    This is the command line interface. Computer is waiting for your input."; } | lolcat --animate --speed=120
fi

echo
