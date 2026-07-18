{ ... }:

{
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware = {
    graphics.enable = true;
    nvidia = {
      modesetting.enable = true;
      nvidiaSettings = true;
      powerManagement.enable = true;
    };
  };
}
