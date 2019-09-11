#!/bin/sh
case "$-" in
  *i* )
    case $0 in
      -*) ;;
      *) which fortune >/dev/null 2>&1 && fortune -san 60 ;;
    esac ;;
  * ) ;;
esac
