update:
  nix flake update --flake ~/dotfiles/.config/nixos

clean:
  run0 nh clean all --keep 5 --keep-one --optimise

build host=`hostname`:
  run0 nixos-rebuild switch --flake ~/dotfiles/.config/nixos#{{host}}
