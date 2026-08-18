{ ... }:

{
  services.xserver.xkb.layout = "latam";
  services.xserver.xkb.options = "ctrl:ralt_rctrl,lv3:enter_switch";
  environment.sessionVariables = {
    XKB_DEFAULT_LAYOUT = "latam";
    XKB_DEFAULT_OPTIONS = "ctrl:ralt_rctrl,lv3:enter_switch";
  };
}
