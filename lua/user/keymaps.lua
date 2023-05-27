local opts = { noremap = true, silent = true }
local remap_opts = {remap =true, silent = true}
local term_opts = { silent = true } -- Shorten function name

local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Naviagate buffers
-- keymap("n", "<S-l>", ":bnext<CR>", opts)
-- keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<Tab>", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeTroggle<CR>", opts)

-- Telescope
keymap("n", "<leader>f", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- new line
keymap("n", "op", "o<ESC>k", opts)
keymap("n", "oi", "O<ESC>j", opts)
keymap("n", "oo", "o", opts)

-- yank
keymap("n", "Y", "y$", opts)

-- goto-preview
keymap("n", "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", opts)

-- Keep Cursor
keymap("n", "J", "mzJ`z", opts)
keymap("n", "<C-d>", "<C-d>zz", remap_opts)
keymap("n", "<C-u>", "<C-u>zz", remap_opts)
keymap("n", "n", "nzzzv", remap_opts)
keymap("n", "N", "Nzzzv", remap_opts)

--tmux 
keymap("n", "<C-f>", "<cmd>!tmux neww tmux-sessionizer<CR>", opts)

-- replace 
keymap("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {silent = false})
keymap("n", "<leader>rr", [[:%s/\<<C-r><C-w>//gc<Left><Left><Left>]], {silent = false})
keymap("n", "<leader>ry", [[:%s/\<<C-r><C-w>/<C-r>0/g<CR>]], {silent = false})


-- git fixed merge 
-- keymap("n", "gu", "<cmd>diffget //2<CR>")
-- keymap("n", "gu", "<cmd>diffget //3<CR>")


-- jumping snip
keymap("i", "<c-n>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
keymap("s", "<c-n>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
keymap("i", "<c-p>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
keymap("s", "<c-p>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
