{ pkgs, config, ... }:

{

  wayland.windowManager.sway = with config.colorScheme.palette; {
    enable = true;
    wrapperFeatures.gtk = true;
    
    config = rec {
      modifier = "Mod1";
      terminal = "alacritty";
      menu = "wofi --show run";

      colors = {
        background = "#${base00}";
        focused = {
          background = "#${base00}";
          border = "#${base03}";
          childBorder = "#${base03}";
          text = "#${base06}";
          indicator = "#${base03}";
        };
        unfocused = {
          background = "#${base00}";
          border = "#${base03}";
          childBorder = "#${base03}";
          text = "#${base06}";
          indicator = "#${base03}";
        };
      };
        window = {
          border = 5;
          titlebar = false;
        };
        output = {
          LVDS-1 = {
            bg = "~/Downloads/skele.jpg fill";
          };
        };
        gaps = {
          inner = 6;
          top = 4;
          smartBorders = "on";
        };
        defaultWorkspace = "workspace number 1";

        bars = [{
          command = "waybar";
          colors.activeWorkspace = {
            background = "#${base00}";
            border = "#${base03}";
            text = "#${base06}";
          };
          fonts.size = 15.0;
          position = "top";

        }];

        startup = [
        
        ];
#        keycodebindings = {

#        };
    };
  };
}
  




