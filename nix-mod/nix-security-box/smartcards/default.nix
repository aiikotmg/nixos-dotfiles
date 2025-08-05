# Smartcard tools

{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.smartcards;

in {
    options.modules.smartcards = { enable = mkEnableOption "smartcards"; };
    config = mkIf cfg.enable {
      environment.systemPackages = with pkgs; [
        cardpeek
        libfreefare
        mfcuk
        mfoc
        python3Packages.emv
      ];
    };
}
