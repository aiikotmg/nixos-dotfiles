# Tools to generate packets

{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.packet-gen;

in {
    options.modules.packet-gen = { enable = mkEnableOption "packet-gen"; };
    config = mkIf cfg.enable {
      environment.systemPackages = with pkgs; [
        boofuzz
        gping
        fping
        hping
        ostinato
        pktgen
        python3Packages.scapy
      ];
    };
  }
