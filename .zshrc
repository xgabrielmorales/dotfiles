#+====================================================+
# OH-MY-ZSH
#+====================================================+
# Path to your oh-my-zsh instalation
export ZSH="$HOME/.oh-my-zsh"
# Name of your oh-my-zsh theme
export ZSH_THEME="xgm"

plugins=(
	colored-man-pages
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

#+====================================================+
# FUNDAMENTAL
#+====================================================+
export EDITOR=nvim
export VISUAL=nvim
export READER=zathura
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"

if [ -n "$RANGER_LEVEL" ]; then
	export PS1="[RANGER] $PS1";
fi

#+====================================================+
# FUNCTIONS
#+====================================================+
ext() {
	if [ -f $1 ]; then
		case $1 in
			*.Z)       uncompress $1  ;;
			*.7z)      7z x       $1  ;;
			*.gz)      gunzip     $1  ;;
			*.rar)     unrar e    $1  ;;
			*.tar)     tar xf     $1  ;;
			*.bz2)     bunzip2    $1  ;;
			*.tgz)     tar xzf    $1  ;;
			*.zip)     unzip      $1  ;;
			*.rar)     unrar x    $1  ;;
			*.tbz2)    tar xjf    $1  ;;
			*.tar.gz)  tar xzf    $1  ;;
			*.tar.xz)  tar Jxvf   $1  ;;
			*.tar.bz2) tar xjf    $1  ;;
		esac
	else
		echo "'$1' no es un archivo valido."
	fi
}

#====================================================
# ALIASES
#====================================================
# Navigation
alias dl="cd ~/Downloads && ls -l"
alias doc="cd ~/Documents && ls -l"
alias dotfiles="cd ~/dotfiles && ls -l"
# Reasignaciones
alias vim="nvim"
alias cp="cp -i"
alias rm="rm -I"
alias ls="ls -FXAvhc --group-directories-first --time-style=+'%H:%M %d/%m/%y' --color=auto"
# Trabajo
alias work="cd ~/Documents/Work/runer-api"

# Utilidades
alias cbcopy="xclip -selection clipboard"
alias cbpaste="xclip -selection clipboard -o"
alias pyvenv="source .env/bin/activate"
