---@module 'lazy'
---@type LazySpec[]
return {
  -- Write non-blocking code that looks synchronous
  -- à la asnyc/await in JavaScript
  {
      "gregorias/coop.nvim",
  },
  {
    'LunarVim/bigfile.nvim',
    opts = {
      filesize = 1, -- Mib
      features = {
        'lsp',
        'treesitter',
        'syntax',
        'vimopts',
        'filetype',
        'matchparen',
      }
    }
  }
}
