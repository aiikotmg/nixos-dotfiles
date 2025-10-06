{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.kde;

in {
    options.modules.kde = { enable = mkEnableOption "kde"; };
    config = mkIf cfg.enable {

      services.displayManager.sddm.enable = true;
      services.desktopManager.plasma6.enable = true;

      environment.systemPackages = with pkgs; [
        kdePackages.kate
      ];

    };
}
