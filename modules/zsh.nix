{ pkgs, config, inputs, ... }:

{

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autocd = true;
#    dotDir = ".config/zsh";
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



    hrbld="sudo nixos-rebuild switch --flake /etc/nixos/#hermes";

    hrbldup="sudo nixos-rebuild switch --upgrade --flake /etc/nixos/#hermes && nix-collect-garbage --delete-older-than 12d";
    

    trbld="sudo nixos-rebuild switch --flake /etc/nixos/#titan";
    trbldup="sudo nixos-rebuild switch --upgrade --flake /etc/nixos/#titan";
    test="sudo nixos-rebuild test";

    showip="curl -4 ipaddress.ai";
    steme="gamescope -- /bin/sh -c 'mangoapp& steam'";
  };
  # extra commands to be added to .zshrc
  # type: strings concatenated with "/n"

  initContent = "

  ";
    
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.hstr = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.bash.enable = true;


}
