# Terminal tools

{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.terminals;

in {
    options.modules.terminals = { enable = mkEnableOption "terminals"; };
    config = mkIf cfg.enable {
      environment.systemPackages = with pkgs; [
        cutecom
        minicom
        picocom
        socat
        x3270
      ];
    };
}
