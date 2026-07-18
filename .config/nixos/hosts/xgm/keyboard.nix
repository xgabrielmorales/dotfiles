{ ... }:

{
  services.xserver.xkb = {
    layout = "us";
    variant = "intl";
  };
  environment.sessionVariables = {
    XKB_DEFAULT_LAYOUT = "us";
    XKB_DEFAULT_VARIANT = "intl";
  };
}
