return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'b0o/SchemaStore.nvim',
    },
    opts = {
      servers = require 'config.lsp.jsonls'
    }
  },
  {
    'b0o/SchemaStore.nvim',
    lazy = true,
    version = false,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      ensure_installed = { 'json5', 'jsonc' }
    }
  }
}
