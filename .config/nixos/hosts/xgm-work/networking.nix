{ ... }:

{
  systemd.network.wait-online.enable = false;
  networking = {
    hostName = "xgm-work";
    networkmanager.enable = false;
    dhcpcd.enable = false;
    useDHCP = false;
    nameservers = [
      "1.1.1.1"
      "8.8.8.8"
    ];
    wireless.iwd = {
      enable = true;
      settings = {
        General.EnableNetworkConfiguration = true;
        General.AddressRandomization = "network";
        Network.NameResolvingService = "systemd";
      };
    };
  };
  services.resolved = {
    enable = true;
    settings.Resolve.Domains = [ "~." ];
  };
}
