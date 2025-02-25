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
}
