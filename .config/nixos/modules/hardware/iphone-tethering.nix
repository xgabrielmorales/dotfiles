{ pkgs, ... }:

{
  # usbmuxd is required for iOS USB communication (tethering, file access, etc.)
  services.usbmuxd.enable = true;

  # Enable systemd-networkd for iPhone USB network interface
  systemd.network.enable = true;
  systemd.network.networks."50-iphone-usb" = {
    matchConfig.Name = "eth0";
    networkConfig.DHCP = "yes";
    linkConfig.RequiredForOnline = "no";
  };

  environment.systemPackages = with pkgs; [
    libimobiledevice # CLI tools for interacting with iOS devices
  ];
}
