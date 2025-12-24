{ config, pkgs, lib, ... }:

{

  #gamestuff
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [

    dotnetCorePackages.aspnetcore_9_0-bin
#    dotnetCorePackages.aspnetcore-runtime_9_0
    protontricks
    protonup-qt
    oversteer
    linuxKernel.packages.linux_zen.new-lg4ff
    mangohud
    wine
  ];
 
}
