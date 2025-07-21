#home.nix

{ config, pkgs, inputs, ... }:


{
  imports = [
    inputs.nix-colors.homeManagerModules.default
#    inputs.musnix.nixosModules.default
    ./imports/alacritty.nix
    ./imports/mako.nix
    ./imports/sway.nix
    ./imports/waybar.nix
    ./imports/neovim.nix
    ./imports/zsh.nix
    ./imports/audio.nix
    ../git.nix
  ];


  colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-hard;
  
  #musnix.enable = true;
  
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "hermes";
  home.homeDirectory = "/home/hermes";
  nixpkgs.config.allowUnfree = true;
  #nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
 

#  home.sessionPath = [
#    "$HOME/bin"
#
#  ];

 
#  programs.wireshark.enable = true;
  
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  
  home.packages = with pkgs; [

    wl-clipboard
    wayland
    wofi
    wget
    image-roll
    busybox
    vlc
    pavucontrol
    gnupg
    nmap
    jellyfin-media-player
    miru
    qbittorrent 
    nil
    lua-language-server
#    sqls
    ccls
    gopls
    wev
    fzf
#    git
    cargo
    brightnessctl

  ];


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


   # programs.steam = {
 #   enable = true;
 #   remotePlay.openFirewall = true;
      
 # };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    

  };

  programs.hstr = {
    enable = true;
    enableZshIntegration = true;
  };

  
  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/hermes/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
     EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
