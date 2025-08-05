{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.foot;

in {
    options.modules.foot = { enable = mkEnableOption "foot"; };
    config = mkIf cfg.enable {
        programs.foot = {
            enable = true;
            settings = {
                main = {
                    shell = "zsh";
                    font = "0xProto Nerd Font Mono:size=10";
                    pad = "6x6";
                };
#                colors = with config.colorScheme.palette; {
#                    foreground = "${base06}";
#                    background = "${base00}";
#                    ## Normal/regular colors (color palette 0-7)
#                    regular0="${base00}";  # black
#                    regular1="${base08}";  # red
#                    regular2="${base0B}";  # green
#                    regular3="${base0A}";  # yellow
#                    regular4="${base0D}";  # blue
#                    regular5="${base0E}";  # magenta
#                    regular6="${base0C}";  # cyan
#                    regular7="${base06}";  # white

#                    bright0="${base00}"; # bright black
#                    bright1="${base08}"; # bright red
#                   bright2="${base0B}";# bright green
#                    bright3="${base09}";# bright yellow
#                    bright4="${base0D}";
#                    bright5="${base0E}";# bright magenta
#                    bright6="${base0C}";# bright cyan
#                    bright7="${base06}";# bright white
#                };
            };
        };
    };
}
