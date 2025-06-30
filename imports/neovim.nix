{ pkgs, config, ... }:

{

  programs.neovim = with config.colorScheme.palette; {
    enable = true;
    plugins = with pkgs.vimPlugins; [
#      LazyVim
      trouble-nvim
      nvim-lspconfig
      nvim-treesitter.withAllGrammars
      plenary-nvim
      gruvbox-material
      mini-nvim
      colorbuddy-nvim
      transparent-nvim
      popup-nvim
      staline-nvim
      telescope-nvim
      cheatsheet-nvim
      vim-nix
#      vim-suda
      vim-wayland-clipboard
      cmp_luasnip
      cmp-nvim-lsp
      fidget-nvim
      { plugin = nvim-cmp;
      config = "";
      }
    ];
    extraLuaConfig = "
      local g = vim.g
      local opt = vim.opt
      local lsp = require'lspconfig'
      g.mapleader = ' '
      vim.cmd 'colorscheme gruvbox-material'
      opt.termguicolors = true
      opt.laststatus = 2
      opt.swapfile = false
      opt.number = true
      opt.showmatch = true
      opt.foldmethod = 'marker'
      opt.smartcase = true
      opt.expandtab = true
      opt.shiftwidth = 4
      opt.smartindent = true

      --set language server for cmp :)
      --lsp.lua_ls.setup{}
      lsp.nil_ls.setup{}

      local cmp = require'cmp'

      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn['vsnip#anonymous'](args.body) -- requires vsnip
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'vsnip' },
        }),
      })
    

    ";
    vimAlias= true;
    viAlias = true;
    vimdiffAlias = true;

  };

}
