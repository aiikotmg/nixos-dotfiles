{ pkgs, config, ... }:

{

  home.packages = with pkgs; [
    ardour
    yabridge
    yabridgectl
  ];

}
