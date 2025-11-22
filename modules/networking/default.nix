{ ... }:

{
  networking = {
    defaultGateway = "192.168.1.1";
    hostName = "xgm";
    interfaces.enp8s0.ipv4.addresses = [{
      address = "192.168.1.3";
      prefixLength = 24;
    }];
    nameservers = [ "192.168.1.2" ];
    networkmanager.enable = false;
    useDHCP = false;
  };
  programs.ssh.startAgent = true;
}
