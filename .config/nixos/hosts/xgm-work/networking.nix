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
  };
  services.resolved = {
    enable = true;
    settings.Resolve.FallbackDNS = [
      "1.1.1.1"
      "8.8.8.8"
    ];
  };
}
