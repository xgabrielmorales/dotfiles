{ ... }:

{
  services.xserver.xkb.layout = "latam";
  environment.sessionVariables = {
    XKB_DEFAULT_LAYOUT = "latam";
  };
}
