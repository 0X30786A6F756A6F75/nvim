local status_ok, hop = pcall(require, "hop")
if not status_ok then
	return
end
hop.setup()

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

--[[ keymap("", "L", ":HopChar1<CR>", { silent = true })
keymap("", "Q", ":HopPattern<cr>", { silent = true })

keymap("", "f", ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, case_insentitive=true})<CR>", opts)
keymap("", "F", ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, case_insentitive=true})<CR>", opts)
keymap("", "t", ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1, case_insentitive=true})<CR>", opts)
keymap("", "T", ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = -1, case_insentitive=true})<CR>", opts) ]]
