{ pkgs, lib, config, inputs, ... }:

{

  imports = [
    ./alacritty
    ./chromium
    ./foot
    ./firefox
    ./git
    ./lutris
    ./mako
    ./nvim
    ./sway
    ./waybar
    ./wpaperd
    ./zsh
  ];

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  home.packages = with pkgs; [
    feh
    busybox
    ffmpeg
    wget
    vlc
     
  ];
}
