# Password and hashing tools

{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.pswd;

in {
    options.modules.pswd = { enable = mkEnableOption "pswd"; };
    config = mkIf cfg.enable {
      environment.systemPackages = with pkgs; [
        authoscope
        bruteforce-luks
        brutespray
        conpass
        crunch
        h8mail
        hashcat
        hashcat-utils
        hashdeep
        john
        legba
        medusa
        nasty
        ncrack
        nth
#        phrasendrescher
#        python3Packages.patator
        thc-hydra
        truecrack
      ];
    };
}
