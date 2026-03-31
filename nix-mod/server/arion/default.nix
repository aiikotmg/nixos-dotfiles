{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.arion;

in {
    options.modules.arion = { enable = mkEnableOption "arion"; };
    config = mkIf cfg.enable {
      virtualisation.arion = {
        backend = "docker";
        projects = {
          "glueton".settings.services."guetun".service = {
          image = "gluetun";

          restart = "unless-stopped";
          };
        };
      };
      environment.systemPackages = with pkgs; [
	
      ];
    };
}
