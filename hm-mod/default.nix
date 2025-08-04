{ pkgs, lib, config, inputs, ... }:

{

  imports = [
    ./alacritty
    ./firefox
    ./git
    ./lutris
    ./mako
    ./nvim
    ./sway
    ./waybar
    ./zsh
  ];

  home.packages = with pkgs; [
    feh
    busybox
     
  ];
}
