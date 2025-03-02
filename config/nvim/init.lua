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

vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  -- automatically check for plugin updates
  checker = { enabled = true },
  install = { missing = true },
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

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.create_augroup("close_with_q"),
  pattern = {
    "PlenaryTestPopup",
    "checkhealth",
    "dbout",
    "gitsigns-blame",
    "grug-far",
    "help",
    "lspinfo",
    "neotest-output",
    "neotest-output-panel",
    "neotest-summary",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.schedule(function()
      vim.keymap.set("n", "q", function()
        vim.cmd("close")
        pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
      end, {
        buffer = event.buf,
        silent = true,
        desc = "Quit buffer",
      })
    end)
  end,
})
