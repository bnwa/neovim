-- General LSP client so no runtime fields
return {
  ---@type vim.lsp.ClientConfig
  ---@diagnostic disable-next-line:missing-fields
  vtsls = {
    settings = {
      ['typescript.disableAutomaticTypeAcquisition'] = true,
      ['typescript.check.npmIsInstalled'] = false,

      ['javascript.referencesCodeLens.enabled'] = true,
      ['javascript.referencesCodeLens.showOnAllFunctions'] = true,

      ['typescript.referencesCodeLens.enabled'] = true,
      ['typescript.referencesCodeLens.showOnAllFunctions'] = true,

      ['typescript.implementationsCodeLens.enabled'] = true,
      ['typescript.implementationsCodeLens.showOnInterfaceMethods'] = true,

      ['typescript.tsserver.enableTracing'] = false,
      ['typescript.tsserver.log'] = 'off',

      ['javascript.suggest.completeFunctionCalls'] = true,
      ['javascript.suggest.includeAutomaticOptionalChainCompletions'] = true,

      ['typescript.suggest.completeFunctionCalls'] = true,
      ['typescript.suggest.includeAutomaticOptionalChainCompletions'] = true,

      ['typescript.inlayHints.parameterNames.enabled'] = 'all',
      ['typescript.inlayHints.parameterNames.suppressWhenArgumentMatchesName'] = true,
      ['typescript.inlayHints.parameterTypes.enabled'] = false,
      ['typescript.inlayHints.variableTypes.enabled'] = false,
      ['typescript.inlayHints.variableTypes.suppressWhenTypeMatchesName'] = true,
      ['typescript.inlayHints.propertyDeclarationTypes.enabled'] = false,
      ['typescript.inlayHints.functionLikeReturnTypes.enabled'] = false,
      ['typescript.inlayHints.enumMemberValues.enabled'] = false,

      ['javascript.inlayHints.parameterNames.enabled'] = 'all',
      ['javascript.inlayHints.parameterNames.suppressWhenArgumentMatchesName'] = true,
      ['javascript.inlayHints.parameterTypes.enabled'] = false,
      ['javascript.inlayHints.variableTypes.enabled'] = false,
      ['javascript.inlayHints.variableTypes.suppressWhenTypeMatchesName'] = true,
      ['javascript.inlayHints.propertyDeclarationTypes.enabled'] = false,
      ['javascript.inlayHints.functionLikeReturnTypes.enabled'] = false,
      ['javascript.inlayHints.enumMemberValues.enabled'] = false,

      ['javascript.suggest.includeCompletionsForImportStatements'] = true,
      ['typescript.suggest.includeCompletionsForImportStatements'] = true,

      ['typescript.reportStyleChecksAsWarnings'] = true,

      ['typescript.validate.enable'] = true,

      ['typescript.format.enable'] = true,
      ['typescript.format.insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets'] = true,
      ['typescript.format.semicolons'] = 'remove',

      ['javascript.format.enable'] = true,
      ['javascript.format.insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets'] = true,
      ['javascript.format.semicolons'] = 'remove',

      ['javascript.preferences.useAliasesForRenames'] = false,
      ['typescript.preferences.useAliasesForRenames'] = false,

      ['typescript.updateImportsOnFileMove.enabled'] = 'always',
      ['javascript.updateImportsOnFileMove.enabled'] = 'always',

      ['typescript.tsserver.experimental.enableProjectDiagnostics'] = true,

      ['vtsls.javascript.format.indentSize'] = 2,
      ['vtsls.javascript.format.convertTabsToSpaces'] = true,
      ['vtsls.javascript.format.trimTrailingWhitespace'] = true,
      ['vtsls.javascript.format.indentStyle'] = 'smart',

      ['vtsls.typescript.format.indentSize'] = 2,
      ['vtsls.typescript.format.convertTabsToSpaces'] = true,
      ['vtsls.typescript.format.trimTrailingWhitespace'] = true,
      ['vtsls.typescript.format.indentStyle'] = 'smart',

      ['vtsls.experimental.completion.enableServerSideFuzzyMatch'] = true,

      -- TODO requires handler
      ['vtsls.enableMoveToFileCodeAction'] = true,
    },
    setup = function()
      require('lspconfig.configs').vtsls = require('vtsls').lspconfig
      return true
    end
  }
}
