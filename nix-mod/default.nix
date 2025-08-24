{ pkgs, lib, config, inputs, ... }:

{

  imports = [
    ./fonts
    ./discord
    ./media
    ./godot
  ];

  environment.systemPackages = with pkgs; [

    rustdesk
  ];
}
