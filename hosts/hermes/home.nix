{ pkgs, config, lib, inputs, ...}:

{
  imports = [
    ./../../hm-mod/default.nix
    ./../../bundles/swaydev.nix
    inputs.nix-colors.homeManagerModules.default
  ];
  config = {
    colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-hard;
    modules = {
        # gui
        firefox.enable = true;
        
        # cli
        foot.enable = true;

        # system
        wpaper.enable = true;

    };
    home.stateVersion = "23.11";
  };
}
