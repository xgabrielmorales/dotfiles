{ config, pkgs, ... }:

{
  boot = {
    extraModulePackages = with config.boot.kernelPackages; [
      v4l2loopback
    ];
    kernelModules = [ "v4l2loopback" ];
    extraModprobeConfig = ''
      options v4l2loopback video_nr=10 card_label="Phone Camera" exclusive_caps=1
    '';
  };

  environment.systemPackages = with pkgs; [
    android-tools
    scrcpy
    v4l-utils
  ];
}
