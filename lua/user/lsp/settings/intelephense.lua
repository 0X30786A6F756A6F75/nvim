local home = os.getenv "HOME"

local lspconfig = require "lspconfig"

return {
  default_config = {
    -- cmd = { "intelephense", "--stdio" },
    cmd = { home .. "/.local/share/nvim/mason/packages/intelephense/node_modules/.bin/intelephense", "--stdio" },
    filetypes = { "php" },
    root_dir = { "composer.json", ".git" },
  },
  init_options = {
    licenseKey = {home .. "/intelephense/licence.txt"}
  },
  settings = {
    intelephense = {
      validation = {
        run = "onType",
      },
      telemetry = {
        enable = true,
      },
      trace = {
        server = "verbose",
      },
      diagnostics = {
        enable = true,
      },
      -- code action
      codeAction = {
        disableRuleComment = {
          enable = false,
        },
        disableRuleSuggestion = {
          enable = false,
        },
      },
      -- format
      format = {
        enable = true,
      },
      -- signatura
      signatureHelp = {
        enabled = true,
      },
      -- completion
      completion = {
        fullyQualifyGlobalConstantsAndFunctions = true,
        insertUseDeclaration = true,
        triggerParameterHints = true,
        maxItems = 1000,
      },
      -- rename
      rename = {
        enabled = true,
      },
    },
  },
}
