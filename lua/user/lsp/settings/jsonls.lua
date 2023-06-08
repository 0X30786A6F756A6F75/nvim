local status_ok, schemastore = pcall(require, "schemastore")
if not status_ok then
  return
end
local home = os.getenv "HOME"

return {
  cmd = {home .. "/.local/share/nvim/mason/packages/json-lsp/node_modules/vscode-langservers-extracted/bin/vscode-json-languageserver", "--stdio"},
  init_options = {
    provideFormatter = false,
  },
  settings = {
    json = {
      schemas = schemastore.json.schemas(),
    },
  },
  filetypes = { "json" },
  --[[ setup = {
    commands = {
        Format = {
        function()
          vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line "$", 0 })
        end,
      },
    },
  }, ]]
}
