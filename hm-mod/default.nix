{ pkgs, lib, config, inputs, ... }:

{

  imports = [
    ./alacritty
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

  home.packages = with pkgs; [
    feh
    busybox
    ffmpeg
    wget
    vlc

     
  ];
}
