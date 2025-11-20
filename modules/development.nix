{ pkgs, ... }:

{
  # Docker CLI tools
  environment.systemPackages = with pkgs; [
    docker-buildx
    docker-compose
    docker_28
  ];
  # Docker service configuration
  virtualisation.docker = {
    enable = true;
    enableOnBoot = false;
    autoPrune.enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
      daemon.settings = {
        dns = [ "1.1.1.1" "1.0.0.1" ];
        registry-mirrors = [ "https://mirror.gcr.io" ];
      };
    };
  };

  users.users.xgm.extraGroups = [ "docker" ];
  users.users.xgm.packages = with pkgs; [
    age
    claude-code
    diff-so-fancy
    fd
    gh
    git
    git-extras
    hunspell
    jetbrains.datagrip
    neovim
    nodejs_24
    postman
    postman
    python314
    ripgrep
    sops
    uv
    wireguard-tools
  ];

  programs.nix-ld.enable = true;
}
