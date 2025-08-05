# Fuzzing tools

{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.fuzzers;

in {
    options.modules.fuzzers = { enable = mkEnableOption "fuzzers"; };
    config = mkIf cfg.enable {
      environment.systemPackages = with pkgs; [
        aflplusplus
        feroxbuster
        ffuf
        gobuster
        honggfuzz
        radamsa
        regexploit
        scout
        ssdeep
        wfuzz
        zzuf
      ];
    };
}
