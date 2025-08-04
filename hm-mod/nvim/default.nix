
{ inputs, pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.nvim;

in {
    options.modules.nvim = { enable = mkEnableOption "nvim"; };
    config = mkIf cfg.enable {
      programs.neovim = {# with config.colorScheme.palette; {
        enable = true;
        plugins = with pkgs.vimPlugins; [
#        LazyVim

        dirbuf-nvim
        trouble-nvim
        nvim-lspconfig
        nvim-treesitter.withAllGrammars
        plenary-nvim
        gruvbox-material
        mini-nvim
        colorbuddy-nvim
        auto-pairs
        conflict-marker-vim
        transparent-nvim
        popup-nvim
        staline-nvim
        telescope-nvim
        cheatsheet-nvim
        vim-nix
        vim-wayland-clipboard

      # auto complete and snippets
        friendly-snippets
        cmp_luasnip
        luasnip
        cmp-nvim-lsp
        vim-ccls
        go-nvim
        vim-vsnip
        cmp-vsnip
        fidget-nvim
        { plugin = nvim-cmp;
        config = "";
        }
      ];
    

      extraLuaConfig = "
   
       ${builtins.readFile ./nv.lua}

      ";


      vimAlias= true;
      viAlias = true;
      vimdiffAlias = true;

      };
    };
}
