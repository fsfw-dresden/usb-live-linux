#!/bin/sh

# displays a friendly welcome message

# proceed only if shell interactivity flag is set
case "$-" in
  *i* )
    # proceed when not in ranger or tmux, non-root user, not a linux VT
    # - and do not mess with invoked environments (IDEs, …)
    [ -n "$RANGER_LEVEL" ] || [ -n "$TMUX" ] || [ "$(id -u)" -eq 0 ] || \
      tty | grep -qs ^/dev/tty \\
      grep -qE -- "--init-file|--rcfile|--norc|--noprofile" /proc/$$/cmdline && \
      return ;;
  * ) return ;;
esac

COLOR_CYAN='\033[1;36m'
COLOR_OFF='\033[0;0m'

# needs lolcat and chafa and toilet
[ -x /usr/games/lolcat ] && [ -x /usr/bin/chafa ] && [ -x /usr/bin/toilet ] || return

if [ "$LANG" = "de_DE.UTF-8" ]
then
  echo "    Willkommen zum Kommandozeilenmodus. Computer wartet auf deine Befehle." | lolcat
  printf "	( Tasten ${COLOR_CYAN}[⬆️ UMSCHALT]+[F1]${COLOR_OFF} zum Umschalten hier zum Terminal und zurück )\n"
  [ -f /usr/local/share/icons/keine-panik.svg ] \
    && chafa --format symbols --colors 16 --size $(tput cols)x18 --color-space din99d --fill braille --work 2 --threshold 1 -- /usr/local/share/icons/keine-panik.svg | lolcat \
    || echo "KEINE PANIK" | toilet --filter border | lolcat
else
  echo "    Welcome to the command line interface. Computer is waiting for your input." | lolcat
  printf "	( Press ${COLOR_CYAN}[⬆️ SHIFT]+[F1]${COLOR_OFF} keys to show and hide this terminal )\n"
  [ -f /usr/local/share/icons/dont-panic.svg ] \
    && chafa --format symbols --colors 16 --size $(tput cols)x18 --color-space din99d --fill braille --work 2 --threshold 1 -- /usr/local/share/icons/dont-panic.svg | lolcat \
    || echo "don't panic" | toilet --filter border | lolcat
fi

echo
