{ config, lib, inputs, pkgs, ...}:

{
  imports = [ 
    ./../../hm-mod/default.nix 
    ./../../bundles/dev.nix
    inputs.nix-colors.homeManagerModules.default
  ];
  config = {
    colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-hard;
    modules = {

      # gui

        # cli

        # system

    };
    home.stateVersion = "23.11";
  };
}
