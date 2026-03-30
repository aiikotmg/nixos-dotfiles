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
          container_name = "gluetun";
          capabilities.NET_ADMIN = true;
          ports = "8080:8080/tcp";
          environment = {
            TZ=
            UPDATER_PERIOD=24h
            VPN_SERVICE_PROVIDER=protonvpn
            VPN_TYPE=
            BLOCK_MALICIOUS=off
            WIREGUARD_PRIVATE_KEY=
            PORT_FORWARD_ONLY=on
            VPN_PORT_FORDWARDING=on
            VPN_PORT_FORWARDING_UP_COMMAND=/bin/sh -c 'wget -O- --retry-connrefused --post-data "json={\"listen_port\":{{PORTS}}}" http://127.0.0.1:8080/api/v2/app/setPreferences 2>&1'
            SERVER_COUNTRIES=United States
            
          };
          volumes

          restart = "unless-stopped";
          };
        };
      };
      environment.systemPackages = with pkgs; [
	
      ];
    };
}
