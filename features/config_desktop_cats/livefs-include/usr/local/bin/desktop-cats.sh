#!/bin/bash
# wait a few minutes, then show a fast tiger cat 15% of the time for up to 9min
{
    sleep $(( RANDOM % 30 * 60 ))
    [ $(( RANDOM % 100 + 1 )) -le 15 ] && timeout $(( RANDOM % 9 + 1 ))m oneko -time 90000 -tora -idle 50 -cursor 132;
} &

# wait a few minutes, then show a dark cat 10% of the time for up to 14min
{
    sleep $(( RANDOM % 30 * 60 ))
    [ $(( RANDOM % 100 + 1 )) -le 10 ] && timeout $(( RANDOM % 14 + 1))m oneko -bg black -fg white -cursor 132;
} &
