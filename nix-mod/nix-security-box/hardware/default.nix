# Tools and libraries to access hardware

{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.hardware;

in {
    options.modules.hardware = { enable = mkEnableOption "hardware"; };
    config = mkIf cfg.enable {
      environment.systemPackages = with pkgs; [
        cantoolz
        chipsec
        cmospwd
        esptool
        extrude
        gallia
        hachoir
        nrfutil
        packetry
        teensy-loader-cli
        termineter
        tytools
        python3Packages.angr
        python3Packages.angrop
        python3Packages.can
        python3Packages.pyi2cflash
        python3Packages.pyspiflash
        # routersploit
      ];
    };
}
