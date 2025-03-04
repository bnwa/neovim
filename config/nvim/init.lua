-- Bootstrap lazy.nvim
local lazyrepo = "https://github.com/folke/lazy.nvim.git"
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.api.nvim_echo({ {"Installing lazy.nvim"} }, true, {})
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.colorscheme = 'melange'

-- TODO Will be superceded by clipboard-capable SSH in 0.11
vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync w/ system clipboard
vim.opt.cmdheight = 0 -- Hide command-line unless in use
vim.opt.completeopt = {
  'menu', -- Use a popup menu to show the possible completions
  'menuone', -- Use the popup menu also when there is only one match
  'noselect' -- Do not automatically select a match in the menu
}
vim.opt.confirm = true -- Confirm to save changes before exiting modified buffer
vim.opt.cursorline = true -- Highlight the current line
vim.opt.diffopt:append 'algorithm:histogram' -- Diff with histogram algo
vim.opt.diffopt:append 'linematch:80' -- Recommend line cutoff for diff hunk
vim.opt.expandtab = true -- Render the tab character as as many spaces as defined by tabstop
vim.opt.fileencoding = 'utf-8' -- Enforce UTF-8 buffer encoding
vim.opt.fillchars.foldopen = "" -- Open fold gutter symbol
vim.opt.fillchars.foldopen = "" -- Closed fold gutter symbol
vim.opt.foldcolumn = '0' -- Always hide fold column
vim.opt.foldlevelstart = 99 -- Init bufs with all folds open
vim.opt.gdefault = true -- Scope substitution to the buffer by default
vim.opt.grepprg = "rg --vimgrep" -- Use ripgrep as grep implementation
vim.opt.ignorecase = true -- Ignore case in search, command-line completion
vim.opt.laststatus = 3 -- Enable single, global status line
vim.opt.listchars.extends = '»' -- Show this char when line excedes window right
vim.opt.listchars.precendes = '«' -- Show this char when line excedes window left
vim.opt.number = true -- With 'relativenumber', show the absolute line number on the current line
vim.opt.mousescroll.hor = 1 -- Disable horizontal mouse scroll
vim.opt.mousescroll.ver = 1 -- Scroll 1 line per mouse wheel tick
vim.opt.hlsearch = false -- Disable search highlights
vim.opt.relativenumber = true -- Show line numbers as relative distance from current line
vim.opt.rtp:prepend(lazypath) -- Init lazy.nvim package manager
vim.opt.shada = "!,h,'1000,<50,s10" -- Configure shada file
vim.opt.shiftwidth = 2 -- Length of indent commands as number of spaces
vim.opt.shortmess:append 'C' -- Disable tag search messages
vim.opt.shortmess:append 'I' -- Disable intro message
vim.opt.shortmess:append 'c' -- Disable search navigation messages
vim.opt.shortmess:append 's' -- Disable search end messages
vim.opt.signcolumn = 'yes' -- Prevent win shifting when gutter signs appear
vim.opt.smartcase = true -- Ignore 'ignorecase' when using upper case chars
vim.opt.smoothscroll = true -- Enable smooth scrolling
vim.opt.termguicolors = true -- Enable True Color support
vim.opt.undofile = true -- Enable persistent per file undo history
vim.opt.updatetime = 4000 -- interval in milliseconds of inactivity to write swap
vim.opt.updatecount = 200 -- Number of characters typed at which to write swap
vim.opt.tabstop = 2 -- Define length of tab characters as number of spaces
vim.opt.wrap = false -- Never wrap lines at window boundary

if vim.g.neovide then
  vim.g.neovide_remember_window_size = true
  vim.cmd.cd '~'
end

-- Setup lazy.nvim
require("lazy").setup({
  -- automatically check for plugin updates
  checker = {
    enabled = true,
    notify = false,
  },
  install = {
    missing = true,
  },
  spec = {
    { import = 'config.settings' },
    { import = 'config.plugins.utils' },
    { import = 'config.plugins.tooling' },
    { import = 'config.plugins.parsing' },
    { import = 'config.plugins.filetypes' },
    { import = 'config.plugins.editing' },
    { import = 'config.plugins.ui' },
    { import = 'config.plugins.colorscheme' },
  },
})
