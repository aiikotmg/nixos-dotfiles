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

    media-downloader
#    rustdesk
    davfs2

  ];
}
