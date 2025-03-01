---@module 'lazy'
---@type LazySpec[]
return {
  -- add/delete/change paired delimeters via `ys{motion}{char}`,
  -- `ds{char}`, and `cs{target}{replacement}`, respectively
  {
    "kylechui/nvim-surround",
    -- Use for `*` tag for stability; or use `main` branch for the latest features
    branch = "main",
    event = "VeryLazy",
    config = true
  },
  -- Override comment string for a given treesitter language and
  -- then by treesitter node therein.
  -- Cf. https://github.com/folke/ts-comments.nvim?tab=readme-ov-file#%EF%B8%8F-configuration
  {
    "folke/ts-comments.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    'echasnovski/mini.pairs',
    version = '*',
    opts = {}
  },
  {
    'windwp/nvim-ts-autotag',
    opts = {},
  },
  -- TODO Expand config
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    config = function()
      require('nvim-treesitter.configs').setup {
        textobjects = {
          lsp_interop = {
            enable = true,
          },
          select = {
            enable = true,
          },
          move = {
            enable = true,
          },
        }
      }
    end
  },
  {
    'tzachar/highlight-undo.nvim',
    opts = {
      hlgroup = "HighlightUndo",
      duration = 300,
      pattern = {"*"},
      ignored_filetypes = { "neo-tree", "fugitive", "TelescopePrompt", "mason", "lazy" },
      -- ignore_cb is in comma as there is a default implementation. Setting
      -- to nil will mean no default os called.
      -- ignore_cb = nil,
    },
  },
  {
    "gbprod/yanky.nvim",
    opts = {},
  },
}
