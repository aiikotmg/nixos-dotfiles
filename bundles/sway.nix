{ pkgs, ... }:

{
     imports = [
        ../hm-mod/default.nix
      ];

      config = {
        modules = {
          alacritty.enable = true;
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
          feh
          ffmpeg
          wget
          image-roll
          busybox
          vlc
          pavucontrol
          gnupg
          brightnessctl

        ];
    

    };
  }
