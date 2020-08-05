#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export EDITOR="vim"
export HISTCONTROL=ignoredups:erasedups

# Promt
PS1="\[\e[34m\]\u\[\e[00m\] at \[\e[32m\]\h\[\e[00m\] \[\e[33m\][\w]\[\e[00m\]\n$ "

# ALIASES
alias free="free -m"
alias cp="cp -i"

alias ls='ls -FXhAc --group-directories-first --time-style=+"%H:%M %d/%m/%Y " --color=auto'
alias lsd="ls -lAF | grep '^d'"

alias doc='cd ~/Documents && ls -lA'
alias dl='cd ~/Downloads && ls -lA'

alias dotfiles="cd ~/dotfiles"
alias dconfig="cd ~/dotfiles/.config"

