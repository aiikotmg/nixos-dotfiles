# Proxy tools for MitM scenarios

{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.proxies;

in {
    options.modules.proxies = { enable = mkEnableOption "proxies"; };
    config = mkIf cfg.enable {
      environment.systemPackages = with pkgs; [
        bettercap
        burpsuite
        ettercap
        mitmproxy
        mubeng
        proxify
        proxychains
        redsocks
        rshijack
        zap
      ];
    };
}
