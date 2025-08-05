# Tools for DNS queries and enumeration

{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.dns;

in {
    options.modules.dns = { enable = mkEnableOption "dns"; };
    config = mkIf cfg.enable {
      environment.systemPackages = with pkgs; [
        aiodnsbrute
        amass
        bind
        dnsenum
        dnsmon-go
        dnsmonster
        dnsrecon
        dnstake
        dnstracer
        dnstwist
        dnspeep
        dnsvalidator
        dnsx
        fierce
        findomain
        knockpy
        massdns
        subfinder
        subprober
        subzerod
        wtfis
      ];
    };
}
