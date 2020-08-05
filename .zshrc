# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="xgm"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export EDITOR="nvim"
export HISTCONTROL=ignoredups:erasedups

export TERM=xterm-256color

# ALIASES
alias free="free -m"
alias cp="cp -i"

alias ls='ls -FXhAc --group-directories-first --time-style=+"%H:%M %d/%m/%Y " --color=auto'
alias ld="ls -lAF | grep '^d'"

alias doc='cd ~/Documents && ls -lA'
alias dl='cd ~/Downloads && ls -lA'

alias dotfiles="cd ~/dotfiles && ls"
alias dev="cd ~/Documents/dev"
alias vim="nvim"
alias dconfig="cd ~/dotfiles/.config"
alias chrome="cd /home/xgm/.mozilla/firefox/rszqgpto.default-release/chrome"

ext(){
	if [ -f $1 ]; then
		case $1 in
			*.tar.bz2)  tar xjf $1     ;;
			*.tar.xz)   tar Jxvf $1    ;;
			*.tar.gz)   tar xzf $1     ;;
			*.bz2)      bunzip2 $1     ;;
			*.rar)      unrar e $1     ;;
			*.gz)       gunzip $1      ;;
			*.tar)      tar xf $1      ;;
			*.tbz2)     tar xjf $1     ;;
			*.tgz)      tar xzf $1     ;;
			*.zip)      unzip $1       ;;
			*.Z)        uncompress $1  ;;
			*.7z)       7z x $1        ;;
			*.rar)      unrar x $1     ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

ccc(){
	if [ -f $1 ]; then
		case $1 in
			*.c) 	gcc $1 -o ejecutable && ./ejecutable       ;;
			*.cpp) 	g++ $1 -o ejecutable && ./ejecutable       ;;
		esac
	else
		echo "'$1' no es un archivo valido"
	fi
}
