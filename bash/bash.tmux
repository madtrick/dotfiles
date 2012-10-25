# If not running interactively, do not do anything
#[[ $- != *i* ]] && return
#[[ $TERM != screen* ]] && exec tmux
