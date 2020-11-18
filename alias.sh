export EDITOR=nvim
export VISUAL=nvim
export READER=zathura
export TERM=xterm-256color

# Aliases
alias cp="cp -i"
alias rm="rm -i"

#alias ls="lsd -FAh"
alias la="ls -og"
alias ld="ls -lAF | grep '^d'"
alias ls="ls -FXAhc --group-directories-first --time-style=+'%H:%M %d/%m/%y' --color=auto"

#############
# Navegación
#############
alias dl="cd ~/Downloads && ls -l"
alias doc="cd ~/Documents && ls -l"
alias wallpapers="cd ~/Pictures/wallpapers/ && ls -l"
# - Dotfiles -
alias dotfiles="cd ~/dotfiles && ls -l"
alias dconfig="cd ~/dotfiles/.config && ls -l"
alias vimconfig="cd ~/.config/nvim/ && ls -l"
alias chrome="cd ~/.mozilla/firefox/rszqgpto.default-release/chrome && ls -l"
# - Desarrollo -
alias dev="cd ~/Documents/dev && ls -l"
# - Carrera de Matemáticas -
alias math="cd ~/Documents/math && ls -l"
# Contracciones
alias vim="nvim"
alias down="nmcli connection down Conexión\ cableada\ 1"
alias up="nmcli connection up Conexión\ cableada\ 1"
