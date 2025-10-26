{ ... }:

{
  virtualisation.docker = {
    enable = true;
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
}
