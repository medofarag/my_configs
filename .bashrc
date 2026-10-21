source ~/.config/bash/aliases.sh
source ~/.config/bash/functions.sh
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

alias reload=source ~/.bashrc
