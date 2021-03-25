#!/bin/bash

#+====================================================+
# INSTALACIÓN
#+====================================================+

dotfiles_dir=$HOME/dotfiles   # Ruta de tus dotfiles
mkdir -p "$HOME/old_dotfiles" # Ruta de tus dotfiles viejos

# home DIRECTORY
home_files=( ".bashrc" ".zshrc" ".tmux.conf" )

for file in "${home_files[@]}"; do
	if [ -L $HOME/$file ]; then
		unlink $HOME/$file
	elif [ -e $HOME/$file ]; then
		mv "$HOME/$file" "$HOME/old_dotfiles/"
	fi
	ln -s $dotfiles_dir/$file $HOME/
done

# .config DIRECTORY
for file in `ls -A $dotfiles_dir/.config`; do
	if [ -L $HOME/.config/$file ]; then
		unlink $HOME/.config/$file
	elif [ -e $dotfiles_dir/.config/$file ]; then
		mv "$HOME/.config/$file" "$HOME/old_dotfiles/"
	fi
	ln -s $dotfiles_dir/.config/$file $HOME/.config
done

echo "Instalación completada."
