_:

{
  boot = {
    binfmt.emulatedSystems = [ "aarch64-linux" ];
    consoleLogLevel = 0;
    kernelParams = [
      "quiet"
      "splash"
      "udev.log_level=3"
    ];
    plymouth.enable = true;
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        configurationLimit = 5;
        editor = false;
        enable = true;
      };
      timeout = 5;
    };
    tmp.cleanOnBoot = true;
  };
  services.fstrim.enable = true;
  zramSwap.enable = true;
}
