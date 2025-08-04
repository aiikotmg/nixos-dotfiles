{ config, lib, inputs, ...}:

{
  imports = [ 
    ./../../hm-mod/default.nix 
    ./../../bundles/dev.nix
  ];
  config = {
    modules = {
      # gui
      lutris.enable = true;

        # cli

        # system

    };
    home.stateVersion = "23.11";
  };
}
