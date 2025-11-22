{ lib, ... }:

{
  options = {
    mainUser = lib.mkOption {
      type = lib.types.str;
      default = "xgm";
      description = "Main user of the system";
    };
  };
}
