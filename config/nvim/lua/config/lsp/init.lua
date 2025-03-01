local M = {}

M.diagnostics = {
  float = {
    source = 'if_many',
  },
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.INFO] = '󰋽',
      [vim.diagnostic.severity.HINT] = '',
    },
  },
  underline = false,
  update_in_insert = true,
  virtual_text = false
}

function M.match(file_ext)
  if file_ext == 'lua' then
    return { 'lua_ls' }
  end
  return nil
end

function M.on_attach(client, buf)
  local supports_inlay_hints =
  client.supports_method('textDocument/inlayHint', { bufnr = buf })
  and vim.api.nvim_buf_is_valid(buf)
  and vim.bo[buf].buftype == ''

  local supports_code_lens =
  client.supports_method('textDocument/codeLens', { bufnr = buf })
  and vim.api.nvim_buf_is_valid(buf)
  and vim.bo[buf].buftype == ''

  if supports_code_lens then
    vim.lsp.codelens.refresh()
    vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
      buffer = buf,
      callback = vim.lsp.codelens.refresh,
    })
  end

  if supports_inlay_hints then
    vim.lsp.inlay_hint.enable(true, { bufnr = buf })
  end

  vim.diagnostic.config(M.diagnostics)
  vim.diagnostic.enable(true, { bufnr = buf })
end

function M.setup(server_name, server_config)
  local lsp = require 'lspconfig'
  local cmp = require 'blink.cmp'

  --local on_attach = server_config.on_attach
  local capabilities = vim.tbl_deep_extend('force', {},
    vim.lsp.protocol.make_client_capabilities(),
    server_config.capabilities or {})
  local config = vim.tbl_extend('force', {},
    server_config,
    { capabilities = cmp.get_lsp_capabilities(capabilities) })

  if type(config.setup) == 'function' then
    config.setup(config)
  else
    lsp[server_name].setup(config)
  end
end

return M
