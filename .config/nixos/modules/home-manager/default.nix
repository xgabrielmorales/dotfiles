{ mainUser, zen-browser, ... }:

{
  home-manager.users.${mainUser} = import ./home.nix;
  home-manager.extraSpecialArgs = { inherit mainUser zen-browser; };
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
}
