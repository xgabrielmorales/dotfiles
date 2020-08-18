export ZSH="$HOME/.oh-my-zsh"
export EDITOR="nvim"
export HISTCONTROL=ignoredups:erasedups
export TERM=xterm-256color

ZSH_THEME="xgm"
source $ZSH/oh-my-zsh.sh

plugins=(git)

# Aliases
alias cp="cp -i"
alias vim="nvim"
alias free="free -m"

alias ld="ls -lAF | grep '^d'"
alias ls="ls -FXhAc --group-directories-first --time-style=+'%H:%M %d/%m/%y' --color=auto"

alias dev="cd ~/Documents/dev"
alias dl="cd ~/Downloads && ls -lA"
alias doc="cd ~/Documents && ls -lA"
alias dotfiles="cd ~/dotfiles && ls"
alias dconfig="cd ~/dotfiles/.config"
alias chrome="cd /home/xgm/.mozilla/firefox/rszqgpto.default-release/chrome"

ext(){
	if [ -f $1 ]; then
		case $1 in
			*.tar.bz2) tar xjf $1     ;;
			*.tar.xz)  tar Jxvf $1    ;;
			*.tar.gz)  tar xzf $1     ;;
			*.bz2)     bunzip2 $1     ;;
			*.rar)     unrar e $1     ;;
			*.gz)      gunzip $1      ;;
			*.tar)     tar xf $1      ;;
			*.tbz2)    tar xjf $1     ;;
			*.tgz)     tar xzf $1     ;;
			*.zip)     unzip $1       ;;
			*.Z)       uncompress $1  ;;
			*.7z)      7z x $1        ;;
			*.rar)     unrar x $1     ;;
		esac
	else
		echo "'$1' isn't a valid file"
	fi
}

ccc(){
	if [ -f $1 ]; then
		case $1 in
			*.c)   gcc $1 -o temp && ./temp && rm temp ;;
			*.cpp) g++ $1 -o temp && ./temp && rm temp ;;
		esac
	else
		echo "'$1' isn't a valid file"
	fi
}
