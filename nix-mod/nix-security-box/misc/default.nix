# Various tools

{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.misc;

in {
    options.modules.misc = { enable = mkEnableOption "misc"; };
    config = mkIf cfg.enable {
      environment.systemPackages = with pkgs; [
        ares-rs
        badchars
        changetower
        creds
        cve-prioritizer
        doona
        exposor
        galleta
        honeytrap
        jwt-cli
        kepler
        nmap-formatter
        penelope
        pwntools
        python3Packages.pytenable
        snscrape
        sr2t
        sttr
        troubadix
      ];
    };
}
