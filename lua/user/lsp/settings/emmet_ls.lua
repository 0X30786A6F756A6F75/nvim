-- https://github.com/pedro757/emmet
-- npm install -g emmet-ls
return {
  cmd = { "emmet-ls", "--stdio" },
  filetypes = {
    "css",
    "eruby",
    "twig",
    "html",
    "javascript",
    "javascriptreact",
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
