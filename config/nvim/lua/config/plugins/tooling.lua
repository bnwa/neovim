---@module 'lazy'
---@type LazySpec[]
return {
  {
    'williamboman/mason.nvim',
    build = ':MasonUpdate',
    dependencies = {
      { "Zeioth/mason-extra-cmds", opts = {} },
    },
    ---@module 'mason'
    ---@type MasonSettings
    opts = {
      registries = {
        'github:bnwa/mason-registry',
        'github:mason-org/mason-registry',
      },
      ui = {
        border = 'rounded',
        icons = {
          package_installed = "✓",
          package_uninstalled = "✗",
          package_pending = "⟳",
        },
      },
    }
  },
}
