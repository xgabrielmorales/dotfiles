# !/bin/bash

#[es] Crea un carpeta para guardar tus dotfiles antiguos
mkdir -p "$HOME/old_dotfiles"

#[es] Ruta de tus dotfiles
dotfiles_dir=$HOME/dotfiles

# +-+-+-+-+ +-+-+-+-+-+-+-+-+-+
# |H|O|M|E| |D|I|R|E|C|T|O|R|Y|
# +-+-+-+-+ +-+-+-+-+-+-+-+-+-+
home_files=( ".bashrc" ".zshrc" ".tmux.conf" )
for file in "${home_files[@]}"; do
	if [ -L $HOME/$file ]; then
		unlink $HOME/$file
	elif [ -e $HOME/$file ]; then
		mv "$HOME/$file" "$HOME/old_dotfiles/"
	fi
	ln -s $dotfiles_dir/$file $HOME/
done

# +-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+
# |.|C|O|N|F|I|G| |D|I|R|E|C|T|O|R|Y|
# +-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+
for file in `ls -A $dotfiles_dir/.config`; do
	if [ -L $HOME/.config/$file ]; then
		unlink $HOME/.config/$file
	elif [ -e $dotfiles_dir/.config/$file ]; then
		mv "$HOME/.config/$file" "$HOME/old_dotfiles/"
	fi
	ln -s $dotfiles_dir/.config/$file $HOME/.config
done

echo "Instalación completada."
