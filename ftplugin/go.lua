local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local vo = vim.opt_local
vo.tabstop = 4
vo.shiftwidth = 4
vo.softtabstop = 4-- configure for golang

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
    {"<leader>Li", "<cmd>GoInstallDeps<CR>", desc="Install Go Dependencies" },
    {"<leader>Lf", "<cmd>GoMod tidy<CR>", desc="Tidy" },
    {"<leader>La", "<cmd>GoTestAdd<CR>", desc="Add Test" },
    {"<leader>LA", "<cmd>GoTestsAll<CR>", desc="Add All Tests" },
    {"<leader>Lc", "<cmd>GoCmt<CR>", desc="Generate Comment" },
    {"<leader>Lj", "<cmd>GoAddTag json<CR>", desc="Add json struct tags" },
    {"<leader>Ly", "<cmd>GoAddTag yaml<CR>", desc="Add yaml struct tags" },
    {"<leader>Lt", "<cmd>lua require('dap-go').debug_test()<cr>", desc="Debug Test" },
    {"<leader>LC",'<cmd>GoCoverage<CR>', desc="Coverage "},
    {"<leader>Le",'<cmd>GoIfErr<CR>', desc="Check error"},
    {"<leader>Lk",'<cmd>GoDoc<CR>', desc="Documentation"},
    {"<leader>Lt",'<cmd>GoTestFile .<CR>', desc="GoTestFile"},
    desc="code"
}

which_key.add(mappings, opts)
