{ ... }:

{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true;
        DiscoverableTimeout = 0;
        Discoverable = false;
      };
      Policy = {
        AutoEnable = true;
      };
    };
  };
}
