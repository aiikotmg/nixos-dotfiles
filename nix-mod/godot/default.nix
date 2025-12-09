{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.godot;

in {
    options.modules.godot = { enable = mkEnableOption "godot"; };
    config = mkIf cfg.enable {

      environment.systemPackages = with pkgs; [

        godot
        gdtoolkit_4

      ];


      programs.nix-ld.enable = true;
      programs.nix-ld.libraries = [
        pkgs.stdenv.cc.cc
        #pkgs.stdenv.cc.cc.lib
      ];


    };
}
