# Bluetooth tools

{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.reveng;

in {
    options.modules.reveng = { enable = mkEnableOption "reveng"; };
    config = mkIf cfg.enable {
      environment.systemPackages = with pkgs; [
        ghidra
      ];
    };
}
