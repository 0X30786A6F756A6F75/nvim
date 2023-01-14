-- Remove statusline and tabline when in AlphaReady
-- vim.api.nvim_create_autocmd({ "User" }, {
--	pattern = { "AlphaReady" },
--	callback = function()
--		vim.cmd([[
--      set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
--      set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
--    ]])
--	end,
-- })
-- Set wrap and spell in markdonw and gitcommit
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "lir" },
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end
})

vim.cmd "autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif"
-- vim.api.nvim_create_autocmd({ "BufEnter" }, {
--   callback = function()
--     vim.cmd [[
--       if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
--     ]]
--   end,
-- })

-- Fixes Autocomment
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  callback = function()
    vim.cmd "set formatoptions-=cro"
  end
})

-- Highlight Yanked Text
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
  end
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = { "*.java" },
  callback = function()
    vim.lsp.codelens.refresh()
  end
})

-- vim.api.nvim_create_autocmd({ "ModeChanged" }, {
--   callback = function()
--     local luasnip = require "luasnip"
--     if luasnip.expand_or_jumpable() then
--       -- ask maintainer for option to make this silent
--       -- luasnip.unlink_current()
--       vim.cmd [[silent! lua require("luasnip").unlink_current()]]
--     end
--   end
-- })

-- autosave, autoformat
vim.api.nvim_create_autocmd({ "FocusLost" }, {
  callback = function()
    -- vim.lsp.buf.format { async = true }
    vim.cmd "silent! w"
  end
})


-- change tabspace to 4 for java and php
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  pattern = { "*.php", "*.java", "*.yaml" },
  callback = function()
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
  end
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*.go" },
  callback = function()
    -- go imports
    vim.cmd "silent! GoImports"
  end
})

vim.api.nvim_create_autocmd({ "CursorHold" }, {
  callback = function()
    local status_ok, luasnip = pcall(require, "luasnip")
    if not status_ok then
      return
    end
    if luasnip.expand_or_jumpable() then
      -- ask maintainer for option to make this silent
      luasnip.unlink_current()
      -- vim.cmd [[silent! lua require("luasnip").unlink_current()]]
    end
  end,
})
