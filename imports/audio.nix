{ pkgs, config, ... }:

{

  home.packages = with pkgs; [
    ardour
    ffmpeg
    yabridge
    yabridgectl
  ];

}
