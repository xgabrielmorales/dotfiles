{ pkgs, ... }:

{
  # usbmuxd is required for iOS USB communication (tethering, file access, etc.)
  services.usbmuxd.enable = true;

  # Enable DHCP on iPhone USB network interfaces
  networking.interfaces."eth0".useDHCP = true;

  environment.systemPackages = with pkgs; [
    libimobiledevice # CLI tools for interacting with iOS devices
  ];
}
