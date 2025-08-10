# Generic tools (terminals, packers, clients, etc.)

{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.common;

in {
    options.modules.common = { enable = mkEnableOption "common"; };
    config = mkIf cfg.enable {
      environment.systemPackages = with pkgs; [
        curl
        gtfocli
        iproute
        iproute2
        macchanger

        netcat-gnu
        whois
        nmap
        zap
        nosqli
        sqlmap

        wireshark
        wireshark-cli
        aircrack-ng
        kismet
        netscanner

        thc-hydra
        john

        metasploit

        # Monitoring
        btop
        iftop
        iotop


        # Terminal multiplexer
        tmux

        # Archive tools
        cabextract
        p7zip
        unrar
        unzip
      ];
    };
}
