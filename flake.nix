# flake.nix


{
  description = "NixOS config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nix-colors.url = "github:misterio77/nix-colors";
    musnix.url = "github:musnix/musnix";
    flake-utils.url = "github:numtide/flake-utils";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
 
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
     
  };

outputs = { self, nixpkgs, nixos-hardware, nix-colors, home-manager, ... }@inputs:
    let
      system = "86x_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        #homeConfigurations."hermes" = home-manager.lib.homeManagerConfiguration {
         # inherit pkgs;

          #extraSpecialArgs = { inherit inputs; };
          modules = [
   #         nur.modules.nixos.default
   #         nur.legacyPackages."${system}".repos.iopq.modules.xraya
            inputs.nix-colors.homeManagerModules.default
            inputs.musnix.nixosModules.default
            ./nixos-dotfiles/configuration.nix
            inputs.home-manager.nixosModules.default
          #  inputs.nixos-hardware.nixosModules.lenovo-thinkpad-x230
          ];
        #};
      };
    };
}
