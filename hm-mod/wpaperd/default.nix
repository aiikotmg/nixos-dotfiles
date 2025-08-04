{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.wpaper;

in {
    options.modules.wpaper = { enable = mkEnableOption "wpaper"; };
    config = mkIf cfg.enable {

      services.wpaperd = {
        enable = true;
        settings = {
          LVDS-1 = {
            path = "/home/hermes/Downloads/madara.jpeg";
            mode = "fit";
          };
        };
      };
    };
}
