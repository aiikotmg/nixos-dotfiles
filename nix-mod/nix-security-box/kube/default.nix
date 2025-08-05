# Kubernetes infrastructure

{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.kube;

in {
    options.modules.kube = { enable = mkEnableOption "kube"; };
    config = mkIf cfg.enable {
      environment.systemPackages = with pkgs; [
        cfripper
        checkov
        cirrusgo
        kdigger
        kube-score
        kubeaudit
        kubestroyer
        kubescape
        popeye
      ];
    };
}
