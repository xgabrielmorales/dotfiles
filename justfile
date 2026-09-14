clean:
  sudo nh clean all --keep 5 --keep-one --optimise

build host=`hostname`:
  sudo nixos-rebuild switch --flake ~/dotfiles/.config/nixos#{{host}}
