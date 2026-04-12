{ pkgs, ... }:

{
  services.usbmuxd.enable = true;

  systemd.network = {
    enable = true;
    networks."50-iphone-usb" = {
      matchConfig.Driver = "ipheth";
      networkConfig.DHCP = "yes";
      linkConfig.RequiredForOnline = "no";
    };
  };

  environment.systemPackages = with pkgs; [
    libimobiledevice
  ];

  # Pre-load ipheth so it's available on first plug
  boot.kernelModules = [ "ipheth" ];

  # apple-mfi-fastcharge resets the USB device config when it binds, which
  # kicks ipheth off the tethering interface immediately after it attaches
  boot.blacklistedKernelModules = [ "apple-mfi-fastcharge" ];
}
