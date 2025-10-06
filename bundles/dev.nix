{ pkgs, lib, config, ... }:

{
     imports = [
        ../hm-mod/default.nix
      ];

        modules = {
          git.enable = true;
          nvim.enable = true;
          zsh.enable = true;
        };
 
        home.packages = with pkgs; [
          #tools

          
          nil
          lua-language-server
          sqls
          ccls
          go
          gopls
          cargo
          ruff
          flutter

        ];
    
      }
     
  
