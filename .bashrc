#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Alias
source $HOME/dotfiles/alias.sh

# Promt
PS1="\u at \h in \[\e[33m\][\w]\[\e[00m\]\n$ "
