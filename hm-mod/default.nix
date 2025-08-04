{ pkgs, lib, config, inputs, ... }:

{

  imports = [
    ./alacritty
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
