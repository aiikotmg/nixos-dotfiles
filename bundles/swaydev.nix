{ pkgs, ... }:

{
     imports = [
        ../hm-mod/default.nix
      ];

      config = {
        modules = {
          alacritty.enable = true;
	  foot.enable = true;
          git.enable = true;
          mako.enable = true;
          nvim.enable = true;
          sway.enable = true;
          waybar.enable = true;
          zsh.enable = true;
        };
 
        home.packages = with pkgs; [
#       environment.systemPackages = with pkgs; [

          #wayland
          wl-clipboard
          wayland
          wofi
          wev

          #general sys
#         base16-builder
#         git
          feh
          ffmpeg
          wget
          image-roll
          busybox
          vlc
          pavucontrol
          gnupg
          brightnessctl

          #tools
          nmap
          qbittorrent

         #entertainment
          jellyfin-media-player
          miru
    
          #nerd stuff
          nil
          lua-language-server
          sqls
          ccls
          go
          gopls
          cargo

        ];
    

          services.redshift = {
          enable = true;

          # Display temperature settings
          temperature = {
            day = 5700;
           night = 3500;
          };
  
       # Location settings (replace with your coordinates)
          latitude = "30.69880614";
          longitude = "-88.02521";
  
        # Schedule settings
          settings = {
            #dawn-time = "6:00";
            #dusk-time = "18:35";
     
            # General settings
            brightness = {
              day = "1";
              night = "0.8";
            };
          };
      };
    };
  }
