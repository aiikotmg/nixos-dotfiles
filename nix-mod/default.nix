{ pkgs, lib, config, inputs, ... }:

{

  imports = [
    ./kde
    ./fonts
    ./discord
    ./media
    ./godot
  ];

  environment.systemPackages = with pkgs; [

    rustdesk
  ];
}
