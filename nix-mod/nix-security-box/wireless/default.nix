# Wireless tools

{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.wireless;

in {
    options.modules.wireless = { enable = mkEnableOption "wireless"; };
    config = mkIf cfg.enable {
      environment.systemPackages = with pkgs; [
        aircrack-ng
        airgeddon
        bully
        cowpatty
        dbmonster
        horst
        killerbee
        kismet
        netscanner
        pixiewps
        reaverwps
        wavemon
        wifite2
        zigpy-cli
      ];
    };
}
