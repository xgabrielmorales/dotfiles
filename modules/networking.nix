{ ... }:

{
  networking = {
    hostName = "xgm";
    nameservers = [ "192.168.1.2" ];
    networkmanager.enable = true;
  };
  programs.ssh.startAgent = true;
}
