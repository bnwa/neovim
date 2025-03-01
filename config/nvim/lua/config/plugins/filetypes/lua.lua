local lua_ls = require 'config.lsp.lua_ls'

return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = { lua_ls = lua_ls }
    }
  },
  {
    'folke/lazydev.nvim',
    opts = {}
  },
}
