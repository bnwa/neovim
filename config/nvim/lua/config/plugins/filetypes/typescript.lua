return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'yioneko/nvim-vtsls'
    },
    opts = {
      servers = require 'config.lsp.vtsls'
    }
  },
  {
    'yioneko/nvim-vtsls',
    config = false
  },
}

