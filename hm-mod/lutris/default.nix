{ pkgs, lib, config, ... }:


with lib;
let cfg = config.modules.lutris;

in {
    options.modules.lutris= { enable = mkEnableOption "lutris"; };
    config = mkIf cfg.enable {
    
      programs.lutris = {
        enable = true;
       extraPackages = with pkgs; [
         mangohud
          winetricks
          gamescope
          gamemode
          umu-launcher

        ];
  
      };  
    };
}
