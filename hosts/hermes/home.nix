{ pkgs, config, lib, inputs, ...}:

{
  imports = [
    ./../../hm-mod/default.nix
    ./../../bundles/sway.nix
    ./../../bundles/dev.nix
    inputs.nix-colors.homeManagerModules.default
  ];
  config = {
    colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-hard;
    modules = {
        # gui
        firefox.enable = true;
        
        # cli

        # system
        wpaper.enable = true;

    };
    home.stateVersion = "23.11";
  };
}
