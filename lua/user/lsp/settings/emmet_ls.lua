-- https://github.com/pedro757/emmet
-- npm install -g emmet-ls
local home = os.getenv "HOME"

return {
  -- cmd = { "emmet-ls", "--stdio" },
  cmd = {home .. "/.local/share/nvim/mason/packages/emmet-ls/node_modules/emmet-ls/out/server.js", "--stdio"},
  filetypes = {
    "css",
    "eruby",
    "twig",
    "html",
    -- "javascript",
    -- "javascriptreact",
    "less",
    "sass",
    "blade",
    "scss",
    "svelte",
    "gohtmltmpl",
    "pug",
    "typescriptreact",
    "vue",
  },
  init_options = {
    html = {
      options = {
        ["bem.enabled"] = true,
      },
    },
  },
}
