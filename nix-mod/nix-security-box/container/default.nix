# Container analysing tools

{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.PROGRAM;

in {
    options.modules.PROGRAM = { enable = mkEnableOption "PROGRAM"; };
    config = mkIf cfg.enable {
      environment.systemPackages = with pkgs; [
        cdk-go
        clair
        cliam
        cloudlist
        dive
        dockle
        fwanalyzer
        grype
        trivy
      ];
    };
}
