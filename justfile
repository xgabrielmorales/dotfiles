clean:
  run0 nh clean all --keep 5 --keep-one --optimise

update:
  nix flake update --flake ~/dotfiles/.config/nixos

rollback host=`hostname`:
  run0 nixos-rebuild switch --flake ~/dotfiles/.config/nixos#{{host}} --rollback

rebuild host=`hostname`:
  run0 nixos-rebuild switch --flake ~/dotfiles/.config/nixos#{{host}}
