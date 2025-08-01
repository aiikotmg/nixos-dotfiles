# flake.nix


{
  description = "NixOS config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nix-colors.url = "github:misterio77/nix-colors";
#    musnix.url = "github:musnix/musnix";
#    flake-utils.url = "github:numtide/flake-utils";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
 
#   fenix = {
#     url = "github:nix-community/fenix";
#     inputs.nixpkgs.follows = "nixpkgs";
#   };
     
  };

outputs = { self, nixpkgs, nixos-hardware, nix-colors, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
        #homeConfigurations."hermes" = home-manager.lib.homeManagerConfiguration {
      nixosConfigurations.hermes = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
          modules = [
            inputs.nix-colors.homeManagerModules.default
#            inputs.musnix.nixosModules.default
#            ./modules/pkgz.nix
            ./hosts/hermes/configuration.nix
            inputs.home-manager.nixosModules.default
          ];
      };
      homeManagerModules.default = ./modules;
    };
}

