-- Highlight Yanked Text
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
  end
})

-- autosave, autoformat
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*.go", "*.php", "python" },
  callback = function()
    vim.cmd "silent! vim.lsp.buf.format()"
    -- vim.cmd "silent! w"
  end
})

-- latex auto compile when save using pdflatex
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*.tex" },
  callback = function()
    vim.cmd "silent! w"
    vim.cmd "silent! !pdflatex %"
  end
})


local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*.go" },
  callback = function()
    -- go imports
    require('go.format').goimport()
  end,
  group = format_sync_grp
})

vim.api.nvim_create_user_command("GoMod", function()
  vim.cmd([[ GoGet ]])
  vim.cmd([[ GoModTidy ]])
  vim.cmd([[ LspRestart ]])
end, {})

-- nvim_create_user_command('GoModTidy', go_mod_tidy, {})
