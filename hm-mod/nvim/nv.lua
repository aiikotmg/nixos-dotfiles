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


      --TODO: load only when needed
      --set language server for cmp :)
      lsp.lua_ls.setup{}
      lsp.nil_ls.setup{}
      lsp.ccls.setup{}
      lsp.sqls.setup{}

      require 'go'.setup({
        goimports = 'gopls', -- if set to 'gopls' will use golsp format
        gofmt = 'gopls', -- if set to gopls will use golsp format
        tag_transform = false,
        test_dir = '',
        comment_placeholder = '   ',
        lsp_cfg = true, -- false: use your own lspconfig
        lsp_gofumpt = true, -- true: set default gofmt in gopls format to gofumpt
        lsp_on_attach = true, -- use on_attach from go.nvim
        dap_debug = true,
      })

--      lsp.bashls.setup{}
--      lsp.sqls.setup{}


      -- luasnip
      require('luasnip.loaders.from_vscode').lazy_load()


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
          { name = 'luasnip' },
        }),
      })

