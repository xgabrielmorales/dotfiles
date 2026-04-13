{ mainUser, ... }:

{
  services.syncthing = {
    enable = true;
    user = mainUser;
    dataDir = "/home/${mainUser}";
  };

  networking.firewall = {
    allowedTCPPorts = [ 22000 ];
    allowedUDPPorts = [ 22000 21027 ];
  };
}
