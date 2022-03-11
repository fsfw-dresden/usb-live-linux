#!/bin/bash
# show a fast tiger cat 5% of the time for up to 90sec
#         or a dark cat 5% of the time for up to 60sec
# and wait up to 30 minutes before doing it
[ $(( RANDOM % 100 + 1 )) -le 5 ] && sleep $(( RANDOM % 30 * 60 )) && timeout $(( RANDOM % 100 + 1 ))s oneko -time 90000 -tora -idle 50 -cursor 132 &
[ $(( RANDOM % 100 + 1 )) -le 5 ] && sleep $(( RANDOM % 30 * 60 )) && timeout $(( RANDOM % 60 + 1))s oneko -bg black -fg white -cursor 132  &
