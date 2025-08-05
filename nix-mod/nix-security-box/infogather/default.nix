# Tools for informtion gathering

{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.infogather;

in {
    options.modules.infogather = { enable = mkEnableOption "infogather"; };
    config = mkIf cfg.enable {
      environment.systemPackages = with pkgs; [
        cloudbrute
        enumerepo
        holehe
        maigret
        metabigor
        # p0f
        sn0int
        socialscan
        theharvester
        urlhunter
      ];
    };
}
