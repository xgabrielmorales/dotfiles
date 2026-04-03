{ ... }:

{
  # Battery
  services.upower.enable = true;

  # WiFi
  networking.wireless.iwd.enable = true;
  networking.wireless.iwd.settings = {
    General.EnableNetworkConfiguration = true;
    Network.NameResolvingService = "systemd";
  };
}
