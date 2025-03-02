---@module 'lazy'
---@type LazySpec[]
return {
  {
    dir = 'user.settings',
    virtual = true,
    event = 'VeryLazy',
    opts = {},
    config = function(_, opts)
      for opt, value in pairs(opts) do
        vim.opt[opt] = value
      end
    end
  },
  {
    dir = 'user.colorscheme',
    virtual = true,
    event = 'VeryLazy',
    config = function()
      local colorscheme = vim.g.colorscheme
      if not pcall(vim.cmd.colorscheme, colorscheme) then
        local msg = 'Failed to load colorscheme: ' .. colorscheme
        local chunks = {{ msg, 'ErrorMsg' }}
        vim.api.nvim_echo(chunks, true, {})
      end

      vim.cmd 'hi! link YankyPut Changed'
      vim.cmd 'hi! link YankyYanked Changed'
      vim.cmd 'hi! link FzfLuaPathLineNr NonText'
      if vim.g.neovide then
        vim.g.neovide_theme = 'auto' -- Neovide will manage light/dark mode
      else
        vim.schedule(function()
          local autocmd = require 'config.utils.autocmd'
          local platform = require 'config.utils.platform'
          local function light_or_dark_mode()
            local ok, mode = platform.exec {
              'defaults', 'read', '-g', 'AppleInterfaceStyle'
            }
            if not ok then
              vim.opt.background = 'light'
            elseif vim.trim(mode) == 'Dark' then
              vim.opt.background = 'dark'
            end
          end
          light_or_dark_mode()
          autocmd.event("Toggle background when focus changes",
            { 'FocusGained', 'FocusLost' },
            { '*' },
            light_or_dark_mode)
        end)
      end
    end,
  }
}
