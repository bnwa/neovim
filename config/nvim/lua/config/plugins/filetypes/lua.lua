return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = require 'config.lsp.lua_ls'
    }
  },
  {
    'folke/lazydev.nvim',
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    }
  },
}
