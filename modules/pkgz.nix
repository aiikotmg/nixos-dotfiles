{ pkgs, lib, inputs, config, ... }:

{

  imports = [
    ./alacritty.nix
    ./sway.nix
    ./waybar.nix
    ./mako.nix
    ./neovim.nix
    ./zsh.nix
#    ./audio.nix
    ./git.nix
    ./firefox.nix

  ];


  #TODO: minecraft, assetto, osu!, tarkov, tidal, discord

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [

    #wayland
    wl-clipboard
    wayland
    wofi
    wev

    #general sys
#    base16-builder
#    git
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

  options = {
    pkgz.enable =
      lib.mkEnableOption "enables pkgz";
  };

  config = lib.mkIf config.pkgz.enable {
    option1 = 5;
    option2 = true;
  };


}
