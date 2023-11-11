-- vim.cmd [[
--   imap <silent><script><expr> <C-A> copilot#Accept("\<CR>")
--   let g:copilot_no_tab_map = v:true
-- ]]

local status_ok, copilot = pcall(require, "copilot")
if not status_ok then
  return
end

local cmp_status_ok, cmp_copilot = pcall(require, "copilot_cmp")
if not cmp_status_ok then
  return
end

copilot.setup {
  cmp = {
    enabled = true,
    method = "getCompletionsCycling",
  },
  panel = {
    enabled = true,
    auto_refresh = true,
  },
  suggestion = {
    enabled = false,
    auto_trigger = true,
    accept = false
  },
}

cmp_copilot.setup()
