# Host security tools

{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.host;

in {
    options.modules.host = { enable = mkEnableOption "host"; };
    config = mkIf cfg.enable {
      environment.systemPackages = with pkgs; [
        checksec
        chkrootkit
        linux-exploit-suggester
        lynis
        safety-cli
        tracee
        vulnix
      ];
    };
}
