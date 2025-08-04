{ pkgs, lib, config, ... }:


with lib;
let cfg = config.modules.mako;

in {
    options.modules.mako= { enable = mkEnableOption "mako"; };
    config = mkIf cfg.enable {
   services.mako = {#with config.colorScheme.palette; {
      enable = true;
      settings = {
#      background-color = "#${base01}";
#      border-color = "#${base0E}";
      border-radius = 5;
      border-size = 2;
#      text-color = "#${base04}";
      layer = "overlay";
     
      };
    };
  };
}
