# SSL/TLS testing tools

{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.tls;

in {
    options.modules.tls = { enable = mkEnableOption "tls"; };
    config = mkIf cfg.enable {
      environment.systemPackages = with pkgs; [
        cero
        gsan
        sslscan
        ssldump
        sslsplit
        sslstrip
        testssl
        tlsinfo
        tlsx
      ];
    };
}
