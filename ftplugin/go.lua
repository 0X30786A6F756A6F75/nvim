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
  G = {
    name = "Go",
    i = { "<cmd>GoInstallDeps<CR>", "Install Go Dependencies" },
    f = { "<cmd>GoMod tidy<CR>", "Tidy" },
    a = { "<cmd>GoTestAdd<CR>", "Add Test" },
    A = { "<cmd>GoTestsAll<CR>", "Add All Tests" },
    c = { "<cmd>GoCmt<CR>", "Generate Comment" },
    j = { "<cmd>GoAddTag json<CR>", "Add json struct tags" },
    y = { "<cmd>GoAddTag yaml<CR>", "Add yaml struct tags" },
    -- t = { "<cmd>lua require('dap-go').debug_test()<cr>", "Debug Test" },
    C = {'<cmd>GoCoverage<CR>', "Coverage "},
    e = {'<cmd>GoIfErr<CR>', "Check error"},
    k = {'<cmd>GoDoc<CR>', "Documentation"},
    t = {'<cmd>GoTestFile .<CR>', "GoTestFile"},
  },
}

which_key.register(mappings, opts)
