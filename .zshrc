#+====================================================+
# ALIASES
#+====================================================+
source $HOME/dotfiles/alias.sh

#+====================================================+
# CONFIGURACIÓN DE OH MY ZSH
#+====================================================+
ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="xgm"

plugins=(
	git
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

#+====================================================+
# OTRAS CONFIGURACIONES
#+====================================================+

# Abre tmux automáticamente al abrir una terminal
if command -v tmux >/dev/null 2>&1 && [ "${DISPLAY}" ]; then
    # if not inside a tmux session,
	# and if no session is started,
	# start a new session
    [ -z "${TMUX}" ] && (tmux attach >/dev/null 2>&1 || tmux)
fi

if [ -n "$RANGER_LEVEL" ]; then
	export PS1="(ranger) $PS1";
fi

#+====================================================+
# FUNCIONES
#+====================================================+

# Extrae cualquier archivo comprimido
ext() {
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
		echo "'$1' no es un archivo valido."
	fi
}
mem() {
    ps -eo rss,pid,euser,args:100 --sort %mem | grep -v grep | grep -i $@ | awk '{printf $1/1024 "MB"; $1=""; print }'
}
