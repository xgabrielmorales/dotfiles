{
  description = "NixOS";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs-2605.url = "github:nixos/nixpkgs?ref=nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      nixpkgs,
      nixpkgs-2605,
      zen-browser,
      home-manager,
      sops-nix,
      ...
    }:
    let
      mkHost =
        name:
        nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            mainUser = name;
            inherit zen-browser;
          };
          modules = [
            ./hosts/${name}
            home-manager.nixosModules.home-manager
            sops-nix.nixosModules.sops
            {
              nixpkgs.overlays = [
                (import ./overlays)
                (final: _: {
                  inherit (nixpkgs-2605.legacyPackages.${final.system}) arc-theme;
                })
              ];
            }
          ];
        };
    in
    {
      nixosConfigurations.xgm = mkHost "xgm";
      nixosConfigurations.xgm-work = mkHost "xgm-work";
    };
}
