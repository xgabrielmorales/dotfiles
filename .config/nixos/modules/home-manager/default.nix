{ config, ... }:

{
  home-manager.users.${config.mainUser} = import ./home.nix;
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
}
