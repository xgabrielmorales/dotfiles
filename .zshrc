export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=xgm
source $ZSH/oh-my-zsh.sh

plugins=(
	git
)

source $HOME/dotfiles/alias.sh

if command -v tmux >/dev/null 2>&1 && [ "${DISPLAY}" ]; then
    # if not inside a tmux session, and if no session is started, start a new session
    [ -z "${TMUX}" ] && (tmux attach >/dev/null 2>&1 || tmux)
fi

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
			*.c)   gcc $1 && ./a.out ;;
			*.cpp) g++ $1 && ./a.out ;;
		esac
	else
		echo "'$1' no es un archivo valido."
	fi
}

mandroid(){
	device=$(simple-mtpfs -l | cut -d : -f 1)
	simple-mtpfs --device $device ~/cell/ && notify-send " Tu dispositivo android está listo para usarse"
}
uandroid(){
	fusermount -u ~/cell/ && notify-send " Tu dispositivo android ha sido desconectado"
}
