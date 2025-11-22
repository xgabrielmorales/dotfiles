{ ... }:

{
  # NVIDIA GPU Configuration
  hardware = {
    graphics.enable = true;
    nvidia = {
      open = true;
      forceFullCompositionPipeline = true;
    };
  };
  # NVIDIA Driver for X Server
  services.xserver = {
    videoDrivers = [ "nvidia" ];
  };
}
