{ ... }:

{
  networking = {
    hostName = "xgm";
    nameservers = [ "1.1.1.1" "1.0.0.1" ];
    networkmanager.enable = true;
  };
  programs.ssh.startAgent = true;
}
