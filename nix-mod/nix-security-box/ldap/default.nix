# LDAP/AD tools

{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.ldap;

in {
    options.modules.ldap = { enable = mkEnableOption "ldap"; };
    config = mkIf cfg.enable {
      environment.systemPackages = with pkgs; [
        adenum
        hekatomb
        msldapdump
        ldapmonitor
        ldapdomaindump
        ldapnomnom
        ldeep
        silenthound
      ];
    };
}
