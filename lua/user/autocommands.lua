-- Highlight Yanked Text
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
  end
})

-- autosave, autoformat
vim.api.nvim_create_autocmd({ "FocusLost" }, {
  callback = function()
    -- vim.lsp.buf.format { async = true }
    vim.cmd "silent! w"
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
