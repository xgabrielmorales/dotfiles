clean:
  run0 nh clean all --keep 5 --keep-one --optimise

update:
  nix flake update --flake ~/dotfiles/.config/nixos

rollback:
  nh os rollback -e run0

rebuild host=`hostname`:
  nh os switch ~/dotfiles/.config/nixos -H {{host}} -e run0
