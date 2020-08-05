#!/bin/sh
case "$PATH" in
  */games* ) ;;
  * ) PATH="$PATH:/usr/games" ;;
esac
