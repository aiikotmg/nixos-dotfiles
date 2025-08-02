{ pkgs, config, ... }:

{

  programs.lutris = {
    enable = true;
    extraPackages with pkgs; [
      mangohud
      winetricks
      gamescope
      gamemode
      umu-launcher

    ];
  
  };
}
