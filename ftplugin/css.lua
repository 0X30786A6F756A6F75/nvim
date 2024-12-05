local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
    {"<leader>Lp", "<cmd>Colortils picker<CR>", desc="Picker" },
    {"<leader>La", "<cmd>Colortils css list<CR>", desc="List" },
    {"<leader>Ld", "<cmd>Colortils darken<CR>", desc="Dark" },
    {"<leader>Lw", "<cmd>Colortils lighten<CR>", desc="Light" },
    {"<leader>Lg", "<cmd>Colortils greyscale<CR>", desc="Greyscale" },
    {"<leader>Lc", "<cmd>Colortils gradient<CR>", desc="Gradient" },
}

which_key.add(mappings, opts)
