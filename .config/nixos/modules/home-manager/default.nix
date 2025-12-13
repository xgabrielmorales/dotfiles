{ mainUser, ... }:

{
  home-manager.users.${mainUser} = import ./home.nix;
  home-manager.extraSpecialArgs = { inherit mainUser; };
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
}
