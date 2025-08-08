# Tools to capture network traffic

{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.traffic;

in {
    options.modules.traffic = { enable = mkEnableOption "traffic"; };
    config = mkIf cfg.enable {
      environment.systemPackages = with pkgs; [
        above
        dhcpdump
        dnstop
        driftnet
        dsniff
        goreplay
        joincap
#        junkie
        netsniff-ng
        ngrep
        secrets-extractor
        sniffglue
        tcpdump
        tcpflow
        tcpreplay
        termshark
        wireshark
        wireshark-cli
        zeek
      ];
    };
}
