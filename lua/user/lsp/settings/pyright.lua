-- setup attach, capabilities, and settings pyright
local M = {}

M.settings = {
  pyright = {
    disableOrganizeImports = true,
    useLibraryCodeForTypes = true,
  },
  python = {
    analysis = {
      typeCheckingMode = "strict",
      autoSearchPaths = true,
      useLibraryCodeForTypes = true,
      diagnosticMode = "workspace",
    },
  },
}

return M
