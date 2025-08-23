{ config, lib, inputs, pkgs, ...}:

{
  imports = [ 
    ./../../hm-mod/default.nix 
    ./../../bundles/dev.nix
    inputs.nix-colors.homeManagerModules.default
    
#    "${inputs.nixos-hardware}/lenovo/thinkpad/x1-extreme/gen2"
#    "${inputs.nixos-hardware}/common/cpu/intel/coffee-lake"
  ];
  config = {
    colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-hard;
    modules = {

      # gui
      lutris.enable = true;
      firefox.enable = true;

        # cli

        # system

    };
    home.stateVersion = "23.11";
  };
}
