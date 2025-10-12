{ config, pkgs, lib, ... }:

{

  #gamestuff
  # some games on #hermes require PROTON_USE_WINED3D=1 MESA_LOADER_DRIVER_OVERRIDE=crocus %command%
  #
  # TODO: get this working right VV
  # gamescope -e -- bash -c " gamemoderun  %command% &; mangoapp"
  # both lines go in the launch options of the game in steam
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [

    dotnetCorePackages.aspnetcore_9_0-bin
#    dotnetCorePackages.aspnetcore-runtime_9_0
    mangohud
  ];
 
}
