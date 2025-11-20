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
}
