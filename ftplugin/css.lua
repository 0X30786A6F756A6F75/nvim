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
  G = {
    name = "Colors",
    p = { "<cmd>Colortils picker<CR>", "Picker" },
    a = { "<cmd>Colortils css list<CR>", "List" },
    d = { "<cmd>Colortils darken<CR>", "Dark" },
    w = { "<cmd>Colortils lighten<CR>", "Light" },
    g = { "<cmd>Colortils greyscale<CR>", "Greyscale" },
    c = { "<cmd>Colortils gradient<CR>", "Gradient" },
  },
}

which_key.register(mappings, opts)
