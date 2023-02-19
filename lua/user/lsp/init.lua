local lsp_status_ok, lsp = pcall(require, "lsp-zero")
if not lsp_status_ok then
  return
end

local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local icons = require "user.icons"

lsp.preset("recommended")

lsp.ensure_installed({
  "cssls",
  "cssmodules_ls",
  "tailwindcss",
  "emmet_ls",
  "jdtls",
  "jsonls",
  "solc",
  "tflint",
  "tsserver",
  "pyright",
  "yamlls",
  "bashls",
  "clangd",
  "rust_analyzer",
  "taplo",
  "intelephense"
})

-- Fix Undefined global 'vim'
lsp.configure('lua-language-server', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})


require('user.cmp')

--cmp_mappings['<Tab>'] = nil
--cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
  suggest_lsp_servers = true,
  sign_icons = {
    error = icons.diagnostics.Error,
    warn = icons.diagnostics.Warning,
    hint = icons.diagnostics.Hint,
    info = icons.diagnostics.Info,
  }
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>ln", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format({ async = true }) end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
  virtual_text = false,
})
require "user.lsp.lsp-signature"

