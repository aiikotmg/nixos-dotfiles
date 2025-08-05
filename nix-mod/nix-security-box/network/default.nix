# Common network tools

{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.network;

in {
    options.modules.network = { enable = mkEnableOption "network"; };
    config = mkIf cfg.enable {
      environment.systemPackages = with pkgs; [
        arp-scan
        arp-scan-rs
        arping
        arpoison
        atftp
        bandwhich
        bngblaster
        cdncheck
        evillimiter
        iperf2
        iputils
        lftp
        mdns-scanner
        mitm6
        mtr
        ncftp
        netcat-gnu
        netdiscover
        netexec
        nload
        nuttcp
        pingu
        putty
        pwnat
        responder
        route-graph
        rustcat
        sshping
        sslh
        tunnelgraf
        wbox
        whois
        yersinia
      ];
    };
}
