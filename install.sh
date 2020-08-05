# !/bin/bash

#[es] Crea un carpeta para guardar tus dotfiles antiguos
mkdir -p "$HOME/old_dotfiles"


#[es] Ruta de tus dotfiles
dotfiles_dir=$HOME/dotfiles
dotfiles_home="$dotfiles_dir/dt_home.txt"

cd "$dotfiles_dir"

# +-+-+-+-+ +-+-+-+-+-+-+-+-+-+
# |H|O|M|E| |D|I|R|E|C|T|O|R|Y|
# +-+-+-+-+ +-+-+-+-+-+-+-+-+-+

for file in `cat $dotfiles_home`; do
	unlink $HOME/$file
	mv "$HOME/$file" "$HOME/old_dotfiles/" &> /dev/null
	ln -s $dotfiles_dir/$file $HOME/ && echo "$file instalado!"
done

# +-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+
# |.|C|O|N|F|I|G| |D|I|R|E|C|T|O|R|Y|
# +-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+

for file in `ls -A .config`; do
	unlink $HOME/.config/$file &> /dev/null
	mv "$HOME/.config/$file" "$HOME/old_dotfiles/" &> /dev/null
	ln -s $dotfiles_dir/.config/$file $HOME/.config && echo "$file instalado!"
done
