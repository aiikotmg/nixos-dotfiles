# Load testing tools

{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.load-testing;

in {
    options.modules.load-testing = { enable = mkEnableOption "load-testing"; };
    config = mkIf cfg.enable {
      environment.systemPackages = with pkgs; [
        ali
        drill
        cassowary
        ddosify
        oha
        siege
        tsung
        vegeta
      ];
    };
}
