local colorscheme = vim.g.colorscheme

if not pcall(vim.cmd.colorscheme, colorscheme) then
  vim.notify('Failed to load colorscheme' .. colorscheme)
end
