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
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    claude-desktop = {
      url = "github:aaddrick/claude-desktop-debian";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      nixpkgs,
      zen-browser,
      home-manager,
      nix-index-database,
      sops-nix,
      claude-desktop,
      ...
    }:
    let
      # Hostname and main user share the same name on every machine
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
            nix-index-database.nixosModules.default
            sops-nix.nixosModules.sops
            {
              nixpkgs.overlays = [
                (import ./overlays)
                claude-desktop.overlays.default
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
