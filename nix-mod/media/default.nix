{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.media;

in {
    options.modules.media = { enable = mkEnableOption "media"; };
    config = mkIf cfg.enable {
      environment.systemPackages = with pkgs; [
        jellyfin-media-player
        miru
        piped
        mangayomi
      ];
    };
}
