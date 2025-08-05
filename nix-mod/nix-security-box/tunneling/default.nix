# Tunneling tools

{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.tunneling;

in {
    options.modules.tunneling = { enable = mkEnableOption "tunneling"; };
    config = mkIf cfg.enable {
      environment.systemPackages = with pkgs; [
        bore-cli
        corkscrew
        hans
        chisel
        httptunnel
        iodine
        sish
        sshuttle
        stunnel
        udptunnel
        wstunnel
      ];
    };
}
