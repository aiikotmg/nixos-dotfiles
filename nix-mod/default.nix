{ pkgs, lib, config, inputs, ... }:

{

  imports = [
    ./kde
    ./fonts
    ./discord
    ./media
    ./godot
    ./pixma
  ];

  environment.systemPackages = with pkgs; [

    media-downloader
#    rustdesk
    davfs2
    passh
  ];
}
