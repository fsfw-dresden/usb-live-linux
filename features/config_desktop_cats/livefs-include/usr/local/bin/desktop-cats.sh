#!/bin/bash
SEED=$(( RANDOM % 10 ))
[ ${SEED} -gt 6 ] && timeout $(( RANDOM % 9 + 1 ))m oneko -time 90000 -tora -idle 50 &
[ ${SEED} -gt 8 ] && timeout $(( RANDOM % 14 + 1))m oneko -bg black -fg white &

