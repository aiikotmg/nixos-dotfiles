# Port scanners

{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.port-scan;

in {
    options.modules.port-scan = { enable = mkEnableOption "port-scan"; };
    config = mkIf cfg.enable {
      environment.systemPackages = with pkgs; [
        das
        havn
        ipscan
        masscan
        naabu
        nmap
        udpx
        smap
        sx-go
        rustscan
        zmap
      ];
    };
}
