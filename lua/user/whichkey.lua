local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = false, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  replace = {
    ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB"
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  keys = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  win = {
    border = "rounded",
    no_overlap = false,
    padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
    title = false,
    title_pos = "center",
    zindex = 1000,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "center", -- align columns left, center or right
  },
  -- ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  -- hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = false, -- show help message on the command line when the popup is visible
  blacklist = {
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  {"<leader>b",  "<cmd>Telescope buffers<cr>", desc="Buffers" },
  {"<leader>e",  "<cmd>NvimTreeToggle<cr>", desc="Explorer" },
  {"<leader>h",  "<cmd>nohlsearch<CR>", desc="No HL" },
  {"<leader>c",  "<cmd>bdelete<CR>", desc="Close Buffer" },

  {"<leader>pc", "<cmd>PackerCompile<cr>", desc="Compile" },
  {"<leader>pi", "<cmd>PackerInstall<cr>", desc="Install" },
  {"<leader>ps", "<cmd>PackerSync<cr>", desc="Sync" },
  {"<leader>pS", "PackerStatus", desc="Status" },
  {"<leader>pu", "<cmd>PackerUpdate<cr>", desc="Update" },

  {"<leader>oc", "<cmd>lua vim.g.cmp_active=false<cr>", desc="Completion off" },
  {"<leader>oC", "<cmd>lua vim.g.cmp_active=true<cr>", desc="Completion on" },
  {"<leader>ow", '<cmd>lua require("user.functions").toggle_option("wrap")<cr>', desc="Wrap" },
  {"<leader>or", '<cmd>lua require("user.functions").toggle_option("relativenumber")<cr>', desc="Relative" },
  {"<leader>od", '<cmd>lua require("user.functions").toggle_double_numbers("statuscolumn")<cr>', desc="Double Numbers" },
  {"<leader>ol", '<cmd>lua require("user.functions").toggle_option("cursorline")<cr>', desc="Cursorline" },
  {"<leader>os", '<cmd>lua require("user.functions").toggle_option("spell")<cr>', desc="Spell" },
  {"<leader>ot", '<cmd>lua require("user.functions").toggle_tabline()<cr>', desc="Tabline" },

  {"<leader>wa", "<cmd>tabnew<CR>", desc="New Tab" },
  {"<leader>wp", "<cmd>tabprev<CR>", desc="Prev Tab" },
  {"<leader>wn", "<cmd>tabnext<CR>", desc="Next Tab" },
  {"<leader>wt", "<cmd>tabclose<CR>", desc="Close Tab" },
  {"<leader>wl", "<cmd>BufferLineCloseLeft<CR>", desc="Close Left Tab" },
  {"<leader>wr", "<cmd>BufferLineCloseRight<CR>", desc="Close Right tabs" },
  {"<leader>wc", "<cmd>BufferLinePick<CR>", desc="Pick Tab Focus" },
  {"<leader>ws", "<cmd>split<cr>", desc="HSplit" },
  {"<leader>wv", "<cmd>vsplit<cr>", desc="VSplit" },

  {"<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc="Breakpoint" },
  {"<leader>dc", "<cmd>lua require'dap'.continue()<cr>", desc="Continue" },
  {"<leader>di", "<cmd>lua require'dap'.step_into()<cr>", desc="Into" },
  {"<leader>do", "<cmd>lua require'dap'.step_over()<cr>", desc="Over" },
  {"<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", desc="Out" },
  {"<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", desc="Repl" },
  {"<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", desc="Last" },
  {"<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", desc="UI" },
  {"<leader>dx", "<cmd>lua require'dap'.terminate()<cr>", desc="Exit" },

  {"<leader>fb", "<cmd>Telescope git_branches<cr>", desc="Checkout branch" },
  {"<leader>ff", "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>", desc="Find files", },
  {"<leader>ft", "<cmd>Telescope live_grep<cr>", desc="Find Text" },
  {"<leader>fs", "<cmd>Telescope grep_string<cr>", desc="Find String" },
  {"<leader>fp", "<cmd>Telescope projects<CR>", desc="Find Projects" },
  {"<leader>fc", "<cmd>:e ~/.config/nvim/init.lua<CR>", desc="Find Projects" },
  {"<leader>fm", "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>", desc="Media" },
  {"<leader>fg", "<cmd>Telescope live_grep theme=ivy<cr>", desc="Find Text" },
  {"<leader>fh", "<cmd>Telescope help_tags<cr>", desc="Help" },
  {"<leader>fl", "<cmd>Telescope resume<cr>", desc="Last Search" },
  {"<leader>fM", "<cmd>Telescope man_pages<cr>", desc="Man Pages" },
  {"<leader>fr", "<cmd>Telescope oldfiles<cr>", desc="Recent File" },
  {"<leader>fR", "<cmd>Telescope registers<cr>", desc="Registers" },
  {"<leader>fk", "<cmd>Telescope keymaps<cr>", desc="Keymaps" },
  {"<leader>fu", "<cmd>Telescope undo<cr>", desc="UndoList" },
  {"<leader>fC", "<cmd>Telescope commands<cr>", desc="Commands" },

        {"<leader>g", "<cmd>lua _LAZYGIT_TOGGLE()<cr>", desc="Lazygit" },
        {"<leader>j", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", desc="Next Hunk" },
        {"<leader>k", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", desc="Prev Hunk" },
        {"<leader>p", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc="Preview Hunk" },
        {"<leader>r", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc="Reset Hunk" },
        {"<leader>R", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc="Reset Buffer" },
        {"<leader>s", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc="Stage Hunk" },
        {"<leader>u", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc="Undo Stage Hunk", },
        {"<leader>o", "<cmd>Telescope git_status<cr>", desc="Open changed file" },
        {"<leader>b", "<cmd>Telescope git_branches<cr>", desc="Checkout branch" },
        {"<leader>c", "<cmd>Telescope git_commits<cr>", desc="Checkout commit" },
        {"<leader>d", "<cmd>Gitsigns diffthis HEAD<cr>", desc="Diff" },
        {"<leader>gGa", "<cmd>Gist -b -a<cr>", desc="Create Anon" },
        {"<leader>gGd", "<cmd>Gist -d<cr>", desc="Delete" },
        {"<leader>gGf", "<cmd>Gist -f<cr>", desc="Fork" },
        {"<leader>gGg", "<cmd>Gist -b<cr>", desc="Create" },
        {"<leader>gGl", "<cmd>Gist -l<cr>", desc="List" },
        {"<leader>gGp", "<cmd>Gist -b -p<cr>", desc="Create Private" },
        {"<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc="Code Action" },
        {"<leader>lc", "<cmd>lua require('user.lsp').server_capabilities()<cr>", desc="Get Capabilities" },
        {"<leader>ld", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc="Workspace Diagnostics" },
        {"<leader>lD", "<cmd>TroubleToggle document_diagnostics<cr>", desc="Document Diagnostics" },
        {"<leader>lf", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", desc="Format" },
        {"<leader>lF", "<cmd>LspToggleAutoFormat<cr>", desc="Toggle Autoformat" },
        --  {"<leader>li", "<cmd>LspInfo<cr>", desc="Info" },
        {"<leader>lI", "<cmd>LspInstallInfo<cr>", desc="Installer Info" },
        {"<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>", desc="Next Diagnostic" },
        {"<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", desc="Prev Diagnostic" },
        {"<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc="CodeLens Action" },
        {"<leader>lq", "<cmd>TroubleToggle quickfix<cr>", desc="Quickfix" },
        {"<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc="Rename" },
        {"<leader>lR", "<cmd>TroubleToggle lsp_references<cr>", desc="References" },
        {"<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc="Document Symbols" },
        {"<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc="Workspace Symbols" },
        {"<leader>lt", '<cmd>lua require("user.functions").toggle_diagnostics()<cr>', desc="Toggle Diagnostics" },
        {"<leader>sc", "<cmd>SnipClose<cr>", desc="Close" },
        {"<leader>sf", "<cmd>%SnipRun<cr>", desc="Run File" },
        {"<leader>si", "<cmd>SnipInfo<cr>", desc="Info" },
        {"<leader>sm", "<cmd>SnipReplMemoryClean<cr>", desc="Mem Clean" },
        {"<leader>sr", "<cmd>SnipReset<cr>", desc="Reset" },
        {"<leader>st", "<cmd>SnipRunToggle<cr>", desc="Toggle" },
        {"<leader>sx", "<cmd>SnipTerminate<cr>", desc="Terminate" },
      {"<leader>t1",":1ToggleTerm<cr>", desc="1"},
      {"<leader>t2",":2ToggleTerm<cr>", desc="2"},
      {"<leader>t3",":3ToggleTerm<cr>", desc="3"},
      {"<leader>t4",":4ToggleTerm<cr>", desc="4"},
      {"<leader>tn","<cmd>lua _NODE_TOGGLE()<cr>", desc="Node"},
      {"<leader>th","<cmd>lua _HTOP_TOGGLE()<cr>", desc="Htop"},
      {"<leader>tp","<cmd>lua _PSQL_TOGGLE()<cr>", desc="Postgres"},
      {"<leader>tr","<cmd>lua _RANGER_TOGGLE()<cr>", desc="Ranger"},
      {"<leader>tm","<cmd>lua _MYSQL_TOGGLE()<cr>", desc="Mysql"},
      {"<leader>tf","<cmd>ToggleTerm direction=float<cr>", desc="Float"},
      {"<leader>tr","<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc="Horizontal"},
      {"<leader>tv","<cmd>ToggleTerm size=80 direction=vertical<cr>", desc="Vertical"},
      {"<leader>Th", "<cmd>TSHighlightCapturesUnderCursor<cr>", desc="Highlight" },
      {"<leader>Tp", "<cmd>TSPlaygroundToggle<cr>", desc="Playground" },
      {"<leader>mm", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", desc="Menu" },
      {"<leader>ma", "<cmd>lua require('harpoon.mark').add_file()<CR>", desc="New File" },
      {"<leader>m1", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", desc="Goto Mark 1" },
      {"<leader>m2", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", desc="Goto Mark 2" },
      {"<leader>m3", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", desc="Goto Mark 3" },
      {"<leader>m4", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", desc="Goto Mark 4" },
      {"<leader>m5", "<cmd>lua require('harpoon.ui').nav_file(5)<CR>", desc="Goto Mark 5" },
      {"<leader>m6", "<cmd>lua require('harpoon.ui').nav_file(6)<CR>", desc="Goto Mark 6" },
      {"<leader>m7", "<cmd>lua require('harpoon.ui').nav_file(7)<CR>", desc="Goto Mark 7" },
      {"<leader>m8", "<cmd>lua require('harpoon.ui').nav_file(8)<CR>", desc="Goto Mark 8" },
      {"<leader>m9", "<cmd>lua require('harpoon.ui').nav_file(9)<CR>", desc="Goto Mark 9" },
      {"<leader>m.", '<cmd>lua require("harpoon.ui").nav_next()<cr>', desc="Harpoon Next" },
      {"<leader>m,", '<cmd>lua require("harpoon.ui").nav_prev()<cr>', desc="Harpoon Prev" },
      {"<leader>rr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], desc="Replace Word" },
      {"<leader>ro", [[:%s/\<<C-r><C-w>//gc<Left><Left><Left>]], desc="Replace Optional" },
      {"<leader>ry", [[:%s/\<<C-r><C-w>/<C-r>0/g<CR>]], desc="Replace Clipboard" },
      {"<leader>rs","<cmd>lua require('spectre').open()<CR>", desc="Open Spectre"},
      {"<leader>rv","<cmd>lua require('spectre').open_visual({select_word=true})<CR>", desc="Select current word Spectre"},
      {"<leader>rw","<cmd>lua require('spectre').open_visual()<CR>", desc="Search current word Spectre"},
      {"<leader>rf","<cmd>lua require('spectre').open_file_search({select_word=true})<CR>", desc="Search on current file Spectre"},
}

local vopts = {
  mode = "v", -- VISUAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}
local vmappings = {
  { "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', desc="Comment", },
  { "<leader>s", "<esc><cmd>'<,'>SnipRun<cr>", desc="Run range" },
  { "<leader>rr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], desc="Replace Word" },
  { "<leader>ro", [[:%s/\<<C-r><C-w>//gc<Left><Left><Left>]], desc="Replace Optional" },
  { "<leader>ry", [[:%s/\<<C-r><C-w>/<C-r>0/g<CR>]], desc="Replace Clipboard" },
}


which_key.setup(setup)
which_key.add(mappings, opts)
which_key.add(vmappings, vopts)
