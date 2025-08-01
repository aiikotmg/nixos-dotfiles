{ pkgs, ... }:

{

  imports = [
    ./alacritty.nix
    ./zsh.nix
    ./firefox.nix
    ./git.nix
  ];

  home.packages = with pkgs; [
    feh
    busybox
    brightnessctl
    
  ];
}
