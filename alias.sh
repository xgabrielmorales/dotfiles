export TERM=xterm-256color
export EDITOR=nvim
export VISUAL=nvim
export READER=zathura
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"

#+====================================================+
# MODIFICACIONES
#+====================================================+
alias cp="cp -i"
alias rm="rm -i"
alias vim="nvim"

alias la="ls -og"
alias ld="ls -lAF | grep '^d'"
alias ls="ls -FXAhc --group-directories-first --time-style=+'%H:%M %d/%m/%y' --color=auto"

#+====================================================+
#  ATAJOS DE NAVEGACIÓN
#+====================================================+
alias dl="cd ~/Downloads && ls -l"
alias doc="cd ~/Documents && ls -l"
alias wallpapers="cd ~/Pictures/wallpapers/ && ls -l"
alias dotfiles="cd ~/dotfiles && ls -l"
alias dconfig="cd ~/dotfiles/.config && ls -l"
alias vimconfig="cd ~/.config/nvim/ && ls -l"
alias chrome="cd ~/.mozilla/firefox/rszqgpto.default-release/chrome && ls -l"
alias dev="cd ~/Documents/dev && ls -l"
alias math="cd ~/Documents/math && ls -l"
