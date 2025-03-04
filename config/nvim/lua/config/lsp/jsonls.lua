return {
  ---@type vim.lsp.ClientConfig
  ---@diagnostic disable-next-line:missing-fields
  jsonls = {
    settings = {
      json = {
        allowComments = { enable = true },
        format = { enable = true },
        validate = { enable = true },
        schemas = {},
      }
    },
    setup = function(config)
      local schemas = require('schemastore').json.schemas()
      vim.list_extend(config.settings.json.schemas, schemas)
      return true
    end
  }
}
