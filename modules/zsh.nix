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



    #some quick shortcuts
    # 
    # TODO: CLEAN UP 
    rebuild="sudo nixos-rebuild switch --flake /etc/nixos/#hermes";

    rebuildup="sudo nixos-rebuild switch --upgrade --flake /etc/nixos/#hermes && nix-collect-garbage -d";

    test="sudo nixos-rebuild test";

    showip="curl -4 ipaddress.ai";
    steme="gamescope -- /bin/sh -c 'mangoapp& steam'";
  };
  # extra commands to be added to .zshrc
  # type: strings concatenated with "/n"

#  initExtra = "

#  ";
    
  };

}
