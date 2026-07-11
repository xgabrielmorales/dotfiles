{ ... }:

{
  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];
  boot.consoleLogLevel = 0;
  boot.initrd.verbose = false;
  boot.kernelParams = [
    "quiet"
    "splash"
    "udev.log_level=3"
  ];
  boot.plymouth.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 5;
  boot.loader.systemd-boot.enable = true;
  boot.loader.timeout = 5;
  boot.tmp.cleanOnBoot = true;
}
