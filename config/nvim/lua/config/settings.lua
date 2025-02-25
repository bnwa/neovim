-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

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
vim.opt.tabstop = 2 -- Define length of tab characters as number of spaces
vim.opt.shiftwidth = 2 -- Length of indent commands as number of spaces

vim.cmd.colorscheme 'habamax'
