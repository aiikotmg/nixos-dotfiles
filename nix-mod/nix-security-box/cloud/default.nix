# Tools to work with cloud environments

{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.cloud;

in {
    options.modules.cloud = { enable = mkEnableOption "cloud"; };
    config = mkIf cfg.enable {
      environment.systemPackages = with pkgs; [
        cloud-nuke
        cloudfox
        ec2stepshell
        gato
        gcp-scanner
        # ggshield
        goblob
        grimoire
        imdshift
        pacu
        poutine
        prowler
        yatas
      ];
    };
}
