# Forensic tools

{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.forensics;

in {
    options.modules.forensics = { enable = mkEnableOption "forensics"; };
    config = mkIf cfg.enable {
      environment.systemPackages = with pkgs; [
        afflib
        amoco
        acquire
        dcfldd
        ddrescue
        dislocker
        dismember
        exiv2
        ext4magic
        extundelete
        foremost
        gef
        gzrt
        hivex
        hstsparser
        noseyparker
        ntfs3g
        ntfsprogs
        nwipe
        recoverjpeg
        safecopy
        sleuthkit
        srm
        stegseek
        testdisk
        volatility3
        wipe
        xorex
      ];
    };
}
