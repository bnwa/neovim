---@module 'lazy'
---@type LazySpec[]
return {
  {
    dir = 'user.settings',
    virtual = true,
    -- Any opts need to be set by plugins
    opts = {},
    config = function()
    end
  },
  {
    dir = 'user.colorscheme',
    virtual = true,
    event = 'VeryLazy',
    config = function()
      local colorscheme = vim.g.colorscheme

      if not pcall(vim.cmd.colorscheme, colorscheme) then
        vim.notify('Failed to load colorscheme: ' .. colorscheme)
      end

      vim.cmd 'hi! link YankyPut Changed'
      vim.cmd 'hi! link YankyYanked Changed'
      vim.cmd 'hi! link FzfLuaPathLineNr NonText'
    end,
  }
}
