#!/bin/bash
# wait a few seconds, then show a fast tiger cat 30% of the time for up to 9min
{ sleep $(( RANDOM % 30 + 5 )) && [ $(( RANDOM % 10 + 1 )) -le 3 ] && timeout $(( RANDOM % 9 + 1 ))m oneko -time 90000 -tora -idle 50; } &

# wait a few seconds, then show a dark cat 20% of the time for up to 14min
{ sleep $(( RANDOM % 30 + 5 )) && [ $(( RANDOM % 10 + 1 )) -le 2 ] && timeout $(( RANDOM % 14 + 1))m oneko -bg black -fg white; } &
