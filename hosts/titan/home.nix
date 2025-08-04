{ config, lib, inputs, ...}:

{
  imports = [ 
    ./../../hm-mod/default.nix 
  ];
  config = {
    modules = {
      # gui
      lutris.enable = true;

        # cli
      nvim.enable = true;
      git.enable = true;

        # system

    };
    home.stateVersion = "23.11";
  };
}
