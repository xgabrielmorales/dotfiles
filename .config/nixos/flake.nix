{
  description = "NixOS";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      nixpkgs,
      zen-browser,
      home-manager,
      nix-index-database,
      ...
    }:
    let
      overlays = [ (import ./overlays) ];
    in
    {
      nixosConfigurations.xgm = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          mainUser = "xgm";
        };
        modules = [
          { nixpkgs.overlays = overlays; }
          ./hosts/xgm
          { _module.args = { inherit zen-browser; }; }
          home-manager.nixosModules.home-manager
          nix-index-database.nixosModules.default
        ];
      };
      nixosConfigurations.xgm-work = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          mainUser = "xgm-work";
        };
        modules = [
          { nixpkgs.overlays = overlays; }
          ./hosts/xgm-work
          { _module.args = { inherit zen-browser; }; }
          home-manager.nixosModules.home-manager
          nix-index-database.nixosModules.default
        ];
      };
    };
}
