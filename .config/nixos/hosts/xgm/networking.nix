{ ... }:

{
  networking = {
    defaultGateway = "10.10.10.1";
    hostName = "xgm";
    hosts."10.10.10.3" = [ "git.xgabrielmorales.com" ];
    interfaces.enp8s0.ipv4.addresses = [
      {
        address = "10.10.10.4";
        prefixLength = 24;
      }
    ];
    nameservers = [
      "10.10.10.3"
      "1.1.1.1"
    ];
    networkmanager.enable = false;
    useDHCP = false;
  };
}
