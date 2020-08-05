export TERM=${TERM:-linux}
export LESS_TERMCAP_us=$(tput bold; tput setaf 5) # underline start: bold, magenta
export LESS_TERMCAP_ue=$(tput sgr0) # underline end: norm

export LESS_TERMCAP_so=$(tput bold; tput rev; tput setaf 2; tput setab 0) # standout mode start: bright green, reverse 
export LESS_TERMCAP_se=$(tput rmso; tput sgr0) # standout mode end: reset

export LESS_TERMCAP_mb=$(tput bold; tput setaf 5) # blinking start: bold, magenta
export LESS_TERMCAP_md=$(tput bold; tput setaf 6) # bold mode start: bold, cyan
export LESS_TERMCAP_me=$(tput sgr0) # mode end: reset

export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim; tput setab 5)
export LESS_TERMCAP_ZN=$(tput ssubm)
export LESS_TERMCAP_ZV=$(tput rsubm)
export LESS_TERMCAP_ZO=$(tput ssupm)
export LESS_TERMCAP_ZW=$(tput rsupm)

export LESS_TERMCAP_ZZ=$(tput sgr0) # reset: do not litter 'env' output
