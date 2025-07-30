{ pkgs, config, ... }:

{

  imports = [
    ./alacritty.nix
    ./sway.nix
    ./waybar.nix
    ./mako.nix
    ./neovim.nix
    ./zsh.nix
#    ./audio.nix
#    ./git.nix

  ];


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
    git
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

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.hstr = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.bash.enable = true;



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

}
