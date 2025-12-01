{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.pixma;

in {
    options.modules.pixma = { enable = mkEnableOption "pixma"; };
    config = mkIf cfg.enable {
      environment.systemPackages = with pkgs; [
        canon-cups-ufr2
        cnijfilter_4_00
        gutenprint
      ];
    };
}
