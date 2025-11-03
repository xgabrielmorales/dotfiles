{
  description = "NixOS";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    zen-browser.url = "github:youwen5/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = { self, nixpkgs, zen-browser }: {
    nixosConfigurations.xgm = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        {
          _module.args = {
            zen-browser = zen-browser.packages.x86_64-linux.default;
          };
        }
        ./configuration.nix
      ];
    };
  };
}
