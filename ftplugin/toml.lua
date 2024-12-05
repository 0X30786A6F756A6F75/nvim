vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  pattern = { "Cargo.toml" },
  callback = function()
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

    local vopts = {
      mode = "v", -- VISUAL mode
      prefix = "<leader>",
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    }

    -- require('crates').focus_popup()
    -- require('crates').hide_popup()

    local mappings = {
        {"<leader>Lu", "<cmd>require('crates').update()<CR>", desc="Toggle Hints" },
        {"<leader>Lr", "<cmd>require('crates').reload()<CR>", desc="Toggle Hints" },
        {"<leader>LU", "<cmd>require('crates').update_crates()<CR>", desc="" },
        {"<leader>LG", "<cmd>require('crates').upgrade_crates()<CR>", desc="" },
    }

    local vmappings = {
        {"<leader>Lt", "<cmd>lua require('crates').toggle()<CR>", desc="Toggle Hints" },
        {"<leader>Lu", "<cmd>lua require('crates').update_crate()<CR>", desc="Update" },
        {"<leader>LU", "<cmd>lua require('crates').upgrade_crate()<CR>", desc="Upgrade" },
        {"<leader>La", "<cmd>lua require('crates').update_all_crates()<CR>", desc="Update All" },
        {"<leader>LA", "<cmd>lua require('crates').upgrade_all_crates()<CR>", desc="Upgrade All" },
        {"<leader>Lh", "<cmd>lua require('crates').open_homepage()<CR>", desc="Open Home" },
        {"<leader>Lr", "<cmd>lua require('crates').open_repository()<CR>", desc="Open Repo" },
        {"<leader>Ld", "<cmd>lua require('crates').open_documentation()<CR>", desc="Open Doc" },
        {"<leader>Lc", "<cmd>lua require('crates').open_crates_io()<CR>", desc="Open Crates.io" },
        {"<leader>Li", "<cmd>lua require('crates').show_popup()<CR>", desc="Info" },
        {"<leader>Lv", "<cmd>lua require('crates').show_versions_popup()<CR>", desc="Versions" },
        {"<leader>Lf", "<cmd>lua require('crates').show_features_popup()<CR>", desc="Features" },
        {"<leader>LD", "<cmd>lua require('crates').show_dependencies_popup()<CR>", desc="Dependencies" },
    }

    which_key.add(mappings, opts)
    which_key.add(vmappings, vopts)
  end,
})
