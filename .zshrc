export EDITOR=nvim
export VISUAL=nvim
export READER=zathura
export TERM=xterm-256color

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=xgm
source $ZSH/oh-my-zsh.sh

plugins=(
	git
)

# Aliases
alias cp="cp -i"
alias vim="nvim"

alias la="ls -og"
alias ld="ls -lAF | grep '^d'"
alias ls="ls -FXAhc --group-directories-first --time-style=+'%H:%M %d/%m/%y' --color=auto"

# Navegación
alias dl="cd ~/Downloads && ls -lA"
alias doc="cd ~/Documents && ls -lA"
alias dotfiles="cd ~/dotfiles && ls -LA"
alias dev="cd ~/Documents/dev && ls -LA"
alias math="cd ~/Documents/math && ls -LA"
alias vimconf="cd ~/.config/nvim/ && ls -LA"
alias dconfig="cd ~/dotfiles/.config && ls -LA"
alias wallpapers="cd ~/Pictures/wallpapers/ && ls -LA"
alias chrome="cd ~/.mozilla/firefox/rszqgpto.default-release/chrome && ls -LA"

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
