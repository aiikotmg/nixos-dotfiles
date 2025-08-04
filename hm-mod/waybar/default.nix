{ inputs, pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.waybar;

in {
    options.modules.waybar= { enable = mkEnableOption "waybar"; };
    config = mkIf cfg.enable {
      programs.waybar = {# with config.colorScheme.palette; {
        enable = true;
        settings = {
        mainBar = {
          layer = "top";
          height = 25;
          output = [
            "LVDS-1"
          ];
          modules-left = [ "sway/workspaces" ];
          modules-center = [ "sway/window" ];
          modules-right = [ "tray" "pulseaudio" "battery" "clock" ];

          clock.format = "{:%I:%M}";

          battery = {
            states = {
              good = 90;
              warning = 30;
              critical = 15;
            };
            format = "{capacity}% {icon}";
            format-full = "{capacity}% {icon}";
            format-charging = "{capacity}%  ";
            format-plugged = "{capacity}%  ";
            format-good = "{time}, {capacity}% {icon}";
            format-icons = [ " " " " " " " " " " ];

          };
        };
      };
    };
  };
}

