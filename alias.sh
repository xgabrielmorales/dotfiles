#====================================================
# VARIABLES DE ENTORNO
#====================================================
export EDITOR=nvim
export VISUAL=nvim
export READER=zathura
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"
#====================================================
# MODIFICACIONES
#====================================================
# Reasignaciones
alias cp="cp -i"
alias rm="rm -I"
alias vim="nvim"
alias ls="ls -FXAhc --group-directories-first --time-style=+'%H:%M %d/%m/%y' --color=auto"
# Clipboard
alias cbcopy="xclip -selection clipboard"
alias cbpaste="xclip -selection clipboard -o"
# Utilidades
alias pyenv="source .env/bin/activate"
# Otros
alias radio="curl https://coderadio-relay-blr.freecodecamp.org/radio/8010/radio.mp3 | mpg123 - 2> /dev/null"
#====================================================
#  ATAJOS DE NAVEGACIÓN
#====================================================
alias dl="cd ~/Downloads && ls -l"
alias doc="cd ~/Documents && ls -l"
alias dev="cd ~/Documents/dev && ls -l"
alias dotfiles="cd ~/dotfiles && ls -l"
