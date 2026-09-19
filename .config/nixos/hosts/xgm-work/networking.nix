{ ... }:

{
  systemd.network.wait-online.enable = false;
  networking = {
    hostName = "xgm-work";
    networkmanager.enable = false;
    dhcpcd.enable = false;
    useDHCP = false;
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
    settings.Resolve = {
      Domains = [ "~." ];
      DNS = [
        "1.1.1.1#one.one.one.one"
        "8.8.8.8#dns.google"
      ];
      DNSOverTLS = true;
    };
  };
}
