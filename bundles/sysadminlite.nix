{ pkgs, ... }:

{
     imports = [
        ../hm-mod/default.nix
        ../nix-mod/default.nix
      ];

      config = {
        modules = {
          alacritty.enable = true;
          git.enable = true;
          mako.enable = true;
          nvim.enable = true;
          waybar.enable = true;
          zsh.enable = true;
        };
 
        home.packages = with pkgs; [
#       environment.systemPackages = with pkgs; [


          #general sys
#         base16-builder
          image-roll
          pavucontrol
          gnupg
          brightnessctl

        ];
    

    };
  }
