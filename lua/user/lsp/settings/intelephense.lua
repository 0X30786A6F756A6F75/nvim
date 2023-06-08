return {
  default_config = {
    cmd = { "intelephense", "--stdio" },
    filetypes = { "php" },
    root_pattern = {'composer.json', '.git'},
  },
  init_options = {
    -- licenseKey =  home .. "intelephense/license.txt",
  },
  settings = {
    --[[ server = {
      on_attach = require("user.lsp.handlers").on_attach,
      capabilities = require("user.lsp.handlers").capabilities,
    }, ]]
    intelephense = {
      validation = {
        run = "onType",
      },
      completion = {
        triggerParameterHints = false,
      },
      telemetry = {
        enable = false,
      },
      trace = {
        server = "verbose",
      },
      diagnostics = {
        enable = true,
      },
    },
  },
}
