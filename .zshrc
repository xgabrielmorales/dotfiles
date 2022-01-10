#+====================================================+
# CONFIGURACIÓN DE OH MY ZSH
#+====================================================+
ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="xgm"

plugins=( zsh-syntax-highlighting colored-man-pages )
source $ZSH/oh-my-zsh.sh

#+====================================================+
# ALIASES
#+====================================================+
source $HOME/dotfiles/alias.sh

#+====================================================+
# OTRAS CONFIGURACIONES
#+====================================================+

# Abre tmux automáticamente al abrir una terminal
#if command -v tmux >/dev/null 2>&1 && [ "${DISPLAY}" ]; then
#	# if not inside a tmux session and no session
#	# is started, then start a new session.
#    [ -z "${TMUX}" ] && (tmux attach >/dev/null 2>&1 || tmux)
#fi

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

mem() {
	arg=$1
	if [ "$arg" = "" ]; then
		ps axo rss,comm,pid | \
			awk '{ proc_list[$2] += $1; } END { for (proc in proc_list) { printf("%d\t%s\n", proc_list[proc],proc); }}' | \
			sort -n | \
			tail -n 10 | \
			sort -rn | \
			awk '{$1/=1024;printf "%.0fMB\t",$1}{print $2}'
	else
		ps -eo rss,pid,euser,args:10 --sort %mem | \
			grep -v grep | \
			grep -i $@ | \
			awk '{print $1,$2,$3,$4}' | \
			awk '{printf $1/1024 "MB"; $1=""; print }'
	fi
}
