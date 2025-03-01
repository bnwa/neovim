---@module 'lazy'
---@type LazySpec[]
return {
  {
    dir = 'user.settings',
    virtual = true,
    config = function()
      vim.g.mapleader = " "
      vim.g.maplocalleader = "\\"
      vim.g.colorscheme = 'melange'

      vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync w/ system clipboard
      vim.opt.cmdheight = 0 -- Hide command-line unless in use
      vim.opt.completeopt = {
        'menu', -- Use a popup menu to show the possible completions
        'menuone', -- Use the popup menu also when there is only one match
        'noselect' -- Do not automatically select a match in the menu
      }
      vim.opt.cursorline = true -- Highlight the current line
      vim.opt.expandtab = true -- Render the tab character as as many spaces as defined by tabstop
      vim.opt.fillchars.foldopen = "" -- Open fold gutter symbol
      vim.opt.fillchars.foldopen = "" -- Closed fold gutter symbol
      vim.opt.foldcolumn = '0' -- Always hide fold column
      vim.opt.number = true -- With 'relativenumber', show the absolute line number on the current line
      vim.opt.relativenumber = true -- Show line numbers as relative distance from current line
      vim.opt.shiftwidth = 2 -- Length of indent commands as number of spaces
      vim.opt.tabstop = 2 -- Define length of tab characters as number of spaces
      vim.opt.wrap = false -- Never wrap lines at window boundary
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
