# VoIP/SIP tools
{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.voip;

in {
    options.modules.voip = { enable = mkEnableOption "voip"; };
    config = mkIf cfg.enable {
      environment.systemPackages = with pkgs; [
        sipp
        sipsak
        sipvicious
        sngrep
      ];
    };
}
