local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
---@diagnostic disable-next-line: missing-parameter
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]
-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here

return packer.startup(function(use)
  -- Plugin Mangager
  use "wbthomason/packer.nvim" -- Have packer manage itself- My plugins here

  -- Lua Development
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  }

  -- Icon
  use "kyazdani42/nvim-web-devicons"

  use "kyazdani42/nvim-tree.lua"
  use "tamago324/lir.nvim"
  use "akinsho/bufferline.nvim"
  use {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end,
  }

  -- Terminal
  use { "akinsho/toggleterm.nvim", tag = "v1.*" }

  -- Project
  use "ahmedkhalf/project.nvim"
  use "windwp/nvim-spectre"

  -- Ident
  use "lukas-reineke/indent-blankline.nvim"

  -- Startup
  use "goolord/alpha-nvim"

  -- Keybinds
  use "folke/which-key.nvim"

  -- Colorschemes
  use "lunarvim/onedarker.nvim"
  use "lunarvim/darkplus.nvim"
  use "folke/tokyonight.nvim"

  -- Color detect
  use "NvChad/nvim-colorizer.lua"
  use "nvim-colortils/colortils.nvim"

  -- styled components
  use { "styled-components/vim-styled-components", branch = "main" }

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "ray-x/lsp_signature.nvim"
  use "SmiteshP/nvim-navic"
  use "simrat39/symbols-outline.nvim"
  use "b0o/SchemaStore.nvim"
  use "RRethy/vim-illuminate"
  use "j-hui/fidget.nvim"
  use "lvimuser/lsp-inlayhints.nvim"
  use "https://git.sr.ht/~whynothugo/lsp_lines.nvim"

  -- Completion
  use "christianchiarulli/nvim-cmp"
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-emoji"
  use "hrsh7th/cmp-nvim-lua"
  use "zbirenbaum/copilot-cmp"
  use "github/copilot.vim"
  use {
    "zbirenbaum/copilot.lua",
    event = { "VimEnter" },
    config = function()
      vim.defer_fn(function()
        require "user.copilot"
      end, 100)
    end,
  }
  use { "tzachar/cmp-tabnine", commit = "1a8fd2795e4317fd564da269cc64a2fa17ee854e", run = "./install.sh" }

  -- Snippet
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- Java
  use "mfussenegger/nvim-jdtls"

  -- Fuzzy Finder/Telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-media-files.nvim"
  use "nvim-telescope/telescope-file-browser.nvim"
  use "debugloop/telescope-undo.nvim"

  -- git differ 
  use 'sindrets/diffview.nvim'

  -- Treesitter
  use "nvim-treesitter/nvim-treesitter"
  use "nvim-treesitter/nvim-treesitter-context"
  use "p00f/nvim-ts-rainbow"
  use "nvim-treesitter/playground"
  use "RRethy/nvim-treesitter-textsubjects"
  use "windwp/nvim-ts-autotag"
  use "nvim-treesitter/nvim-treesitter-textobjects"

  -- Surrond
  use "kylechui/nvim-surround"

  -- DAP
  use "mfussenegger/nvim-dap"
  use "theHamsta/nvim-dap-virtual-text"
  use "rcarriga/nvim-dap-ui"
  use "ravenxrz/DAPInstall.nvim"

  -- previewing goto definition call
  use "rmagatti/goto-preview"
  -- prisma
  use "pantharshit00/vim-prisma"

  -- spellchecker language
  use "lewis6991/spellsitter.nvim"

  -- multi cursor
  use "terryma/vim-multiple-cursors"

  use "nacro90/numb.nvim" -- Visual line
  use "monaqa/dial.nvim" -- Increment/Decrement

  -- Quickfix
  use "kevinhwang91/nvim-bqf"

  -- motion
  use "phaazon/hop.nvim"
  -- use "jinh0/eyeliner.nvim"

  use { "iamcco/markdown-preview.nvim", run = "cd app && npm install", ft = "markdown" }

  -- Utility
  use "rcarriga/nvim-notify"
  use "stevearc/dressing.nvim"
  use "ghillb/cybu.nvim"
  use "moll/vim-bbye"
  use "lewis6991/impatient.nvim"
  use "andymass/vim-matchup"
  -- use "karb94/neoscroll.nvim"

  -- Marks
  use "ThePrimeagen/harpoon"

  -- tabs
  use "tiagovla/scope.nvim"

  -- twig
  use "othree/html5.vim"
  use "lumiliet/vim-twig"

  -- symfony
  use "qbbr/vim-symfony"

  -- repeat nvim
  use "tpope/vim-repeat"

  -- syntaxt highlighting
  use "sheerun/vim-polyglot"

  -- Lualine
  -- use "nvim-lualine/lualine.nvim"
  use "christianchiarulli/lualine.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
