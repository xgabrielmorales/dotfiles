{ pkgs, ... }:

{
  security = {
    pam = {
      u2f = {
        enable = true;
        control = "sufficient";
        settings.cue = true;
      };
      services = {
        sudo.u2fAuth = true;
        login.u2fAuth = true;
        waylock.u2fAuth = true;
      };
    };
  };
  services = {
    pcscd.enable = true;
    udev.packages = [ pkgs.yubikey-personalization ];
  };
  environment.systemPackages = with pkgs; [
    yubikey-manager
    pam_u2f
  ];
}
