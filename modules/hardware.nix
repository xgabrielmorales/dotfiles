{ ... }:

{
  hardware = {
    graphics.enable = true;
    nvidia = {
      open = true;
      forceFullCompositionPipeline = true;
    };
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = { Experimental = true; };
        Policy = { AutoEnable = true; };
      };
    };
  };
}
