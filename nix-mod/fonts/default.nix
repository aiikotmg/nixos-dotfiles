{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.fonts;

in {
    options.modules.fonts = { enable = mkEnableOption "fonts"; };
    config = mkIf cfg.enable {
    # Fonts
    
      fonts.fontDir.enable = true;
        fonts.packages = with pkgs; [
        nerd-fonts._0xproto
        fira-code
        fira-code-symbols
        font-awesome
        udev-gothic
        jetbrains-mono
      ];
    };
}
