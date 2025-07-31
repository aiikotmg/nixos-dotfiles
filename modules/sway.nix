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
#            bg = "config.home.homeDirectory/wall/madara.jpeg fill";
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
          { command = "nm-applet"; }
          { command = "1password --silent"; }
        
        ];
    };
    extraConfig = "
      
      # 1pass
      bindsym Mod1+Shift+p exec 1password --quick-access
      # Brightness
      bindsym XF86MonBrightnessDown exec brightnessctl s 10%-
      bindsym XF86MonBrightnessUp exec brightnessctl s +10%
      # Volume
      bindsym XF86AudioRaiseVolume exec 'pactl set-sink-volume @DEFAULT_SINK@ +1%'
      bindsym XF86AudioLowerVolume exec 'pactl set-sink-volume @DEFAULT_SINK@ -1%'
      bindsym XF86AudioMute exec 'pactl set-sink-mute @DEFAULT_SINK@ toggle'

      assign [class='firefox'] workspace 2
    ";
  };

}
  




