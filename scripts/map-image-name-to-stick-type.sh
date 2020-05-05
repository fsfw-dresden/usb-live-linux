#!/bin/bash
# crudely map build variant or iso names to FSFW stick type

# match patterns in a case-insensitive fashion
shopt -s nocasematch

# limited amount of variants => stupid substring match
case ${@} in
    *schul*)
        echo "SCHULSTICK"
        ;;
    *uni*)
        echo "UNISTICK"
        ;;
    *lern*)
        echo "LERNSTICK"
        ;;
    *mini*)
        echo "MINISTICK"
        ;;
    *)
        echo "couldn't detect variant from string ${@}"
        exit 1
        ;;
esac
