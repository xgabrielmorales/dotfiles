{ pkgs, ... }:

{
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
    extraPackages = [ pkgs.docker-buildx ];
    daemon.settings = {
      dns = [
        "1.1.1.1"
        "1.0.0.1"
      ];
    };
  };
}
