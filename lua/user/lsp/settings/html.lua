-- npm install -g vscode-html-languageserver-bin
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local home = os.getenv "HOME"

return {
  cmd = {home .. "/.local/share/nvim/mason/packages/html-lsp/node_modules/.bin/vscode-html-language-server", "--stdio"},
  filetypes = {
    "html",
    "php",
  },
  capabilities = capabilities,
  configurationSection = { "html", "css", "javascript" },
  embeddedLanguages = {
    css = true,
    javascript = true
  },
  provideFormatter = true
}
