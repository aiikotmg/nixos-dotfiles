{ pkgs, ... }:

{
     imports = [
        ../hm-mod/default.nix
      ];

      config = {
        modules = {
          alacritty.enable = true;
          git.enable = true;
          nvim.enable = true;
          zsh.enable = true;
        };
 
        home.packages = with pkgs; [
          #tools
          nmap

          nil
          lua-language-server
          sqls
          ccls
          go
          gopls
          cargo

        ];
    
      };
    
  }
