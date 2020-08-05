#!/bin/sh
case "$PATH" in
  */$HOME* ) ;;
  * ) PATH="$HOME/.local/bin:$PATH";
esac
