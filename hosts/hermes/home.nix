{ pkgs, config, lib, inputs, ...}:

{
  imports = [
    ./../../hm-mod/default.nix
    ./../../bundles/swaydev.nix
  ];
  config = {
    modules = {
        # gui

        # cli

        # system

    };
    home.stateVersion = "23.11";
  };
}
