{ pkgs, config, lib, inputs, ...}:

{
  imports = [
    ./../../hm-mod/default.nix
    inputs.nix-colors.homeManagerModules.default
  ];
  config = {
    colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-hard;
    modules = {
        # gui
        firefox.enable = true;
#        lutris.enable = true;        
        chromium.enable = true;
        # cli

        # system
#        wpaper.enable = true;
        git.enable = true;
        zsh.enable = true;
        nvim.enable = true;

    };
    home.stateVersion = "23.11";
  };
}
