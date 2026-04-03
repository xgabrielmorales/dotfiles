{ ... }:

{
  # Battery
  services.upower.enable = true;

  # WiFi
  networking.wireless.iwd.enable = true;
  networking.networkmanager.wifi.backend = "iwd";
}
