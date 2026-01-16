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
  users.users.${mainUser}.extraGroups = [ "docker" ];
  programs.nix-ld.enable = true;
}
