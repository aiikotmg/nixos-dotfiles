{ pkgs, config, ... }:

{

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autocd = true;
    dotDir = ".config/zsh";
    oh-my-zsh = {
      enable = true;
      theme = "eastwood";
      plugins = [
        "git"
        "sudo"
        "themes"
      ];
    };
    shellAliases = {
    sudo="sudo";
    ".."="cd ..";
    "..."="cd ../..";
    "...."="cd ../../..";
    "+"="brightnessctl s +10%";
    "-"="brightnessctl s 10%-";

    rebuild="sudo nixos-rebuild switch --flake ~/#default";
    rebuildup="sudo nixos-rebuild switch --upgrade --flake ~/#default";
    test="sudo nixos-rebuild test --flake ~/#default";
    showip="curl -4 ipaddress.ai";
  };
  # extra commands to be added to .zshrc
  # type: strings concatenated with "/n"

#  initExtra = "

#  ";
    
  };

}
