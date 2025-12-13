{ pkgs, mainUser, ... }:

{
  # Docker service configuration
  virtualisation.docker = {
    enable = true;
    enableOnBoot = false;
    autoPrune.enable = true;
    extraPackages = [ pkgs.docker-buildx ];
    daemon.settings = {
      dns = [ "1.1.1.1" "1.0.0.1" ];
      registry-mirrors = [ "https://mirror.gcr.io" ];
    };
  };

  users.users.${mainUser} = {
    extraGroups = [ "docker" ];
    packages = with pkgs; [
      age
      claude-code
      diff-so-fancy
      fd
      firefox
      gh
      git
      git-extras
      hunspell
      jetbrains.datagrip
      neovim
      nodejs_24
      pipx
      postman
      postman
      python314
      ripgrep
      signal-desktop
      sops
      wireguard-tools
    ];
  };

  programs.nix-ld.enable = true;
}
