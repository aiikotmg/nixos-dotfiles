{ config, pkgs, lib, ... }:

{

  #gamestuff
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [

    #system stuff
    wine
    mangohud
    dotnetCorePackages.aspnetcore_9_0-bin
#    dotnetCorePackages.aspnetcore-runtime_9_0
    protontricks
    protonup-qt
    #ffb
    oversteer
    linuxKernel.packages.linux_zen.new-lg4ff

    #launchers
    prismlauncher
    #emulators
    retroarch
    dolphin-emu
    pcsx2

  ];
 
}
