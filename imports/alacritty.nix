{ pkgs, config, ... }:

{
  programs.alacritty.enable = true;
  programs.alacritty.settings = {
    #env.TERM = "alacritty";
    live_config_reload = true;
    shell = "zsh";
    window = {
      decorations = "full";
      opacity = 0.8;
      title = "Alacritty";
      dynamic_title = true;
      class = {
        instance = "Alacritty";
        general = "Alacritty";
      };
    };
    font = {
      normal = {
        family = "JetBrains Mono";
        style = "Light";
      };
      size = 11.0;
    };
    colors = with config.colorScheme.palette; {
      bright = {
        black = "0x${base00}";
        blue = "0x${base0D}";
        cyan = "0x${base0C}";
        green = "0x${base0B}";
        magenta = "0x${base0E}";
        red = "0x${base08}";
        white = "0x${base06}";
        yellow = "0x${base09}";
      };
      cursor = {
        cursor = "0x${base06}";
        text = "0x${base06}";
      };
      normal = {
        black = "0x${base00}";
        blue = "0x${base0D}";
        cyan = "0x${base0C}";
        green = "0x${base0B}";
        magenta = "0x${base0E}";
        red = "0x${base08}";
        white = "0x${base06}";
        yellow = "0x${base0A}";
      };
      primary = {
        background = "0x${base00}";
        foreground = "0x${base06}";
      };
    };
  };
}
