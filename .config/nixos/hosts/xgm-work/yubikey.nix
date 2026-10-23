{ pkgs, ... }:

{
  # Lock all sessions when the YubiKey is unplugged
  services.udev.extraRules = ''
    ACTION=="remove", SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ENV{PRODUCT}=="1050/*", RUN+="${pkgs.systemd}/bin/loginctl lock-sessions"
  '';
}
