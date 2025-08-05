# Bluetooth tools

{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.bluetooth;

in {
    options.modules.bluetooth = { enable = mkEnableOption "bluetooth"; };
    config = mkIf cfg.enable {
      environment.systemPackages = with pkgs; [
        bluez
        bluewalker
        python3Packages.bleak
        redfang
        ubertooth
      ];
    };
}
