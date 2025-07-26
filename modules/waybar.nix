{ pkgs, config, ... }:

{

  programs.waybar = with config.colorScheme.palette; {
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
        modules-right = [ "pulseaudio" "battery" "clock" "tray" ];

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

}
