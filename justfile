delete-generations:
  sudo nix-env --delete-generations --profile /nix/var/nix/profiles/system 1d

clean:
  sudo nix-store --gc

build host=`hostname`:
  sudo nixos-rebuild switch --flake ~/dotfiles/.config/nixos#{{host}}
