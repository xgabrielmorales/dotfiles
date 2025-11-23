{ ... }:

{
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware = {
    graphics.enable = true;
    nvidia = {
      open = false;
      forceFullCompositionPipeline = true;
      modesetting.enable = true;
      nvidiaSettings = true;
      powerManagement.enable = false;
    };
  };
}
