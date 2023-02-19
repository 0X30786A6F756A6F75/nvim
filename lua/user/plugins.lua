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
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  -- Icon
  use "kyazdani42/nvim-web-devicons"

  use "kyazdani42/nvim-tree.lua"
  use "tamago324/lir.nvim"
  use "akinsho/bufferline.nvim"
  use "folke/trouble.nvim" -- show list diagnostics

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

  -- Completion
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "hrsh7th/cmp-emoji"
  use "zbirenbaum/copilot-cmp"
  use { "tzachar/cmp-tabnine", commit = "1a8fd2795e4317fd564da269cc64a2fa17ee854e", run = "./install.sh" }

  -- use "SirVer/ultisnips"
  -- use "quangnguyen30192/cmp-nvim-ultisnips"
  -- snippe snippy users.
  -- use "dcampos/nvim-snippy"
  -- use "dcampos/cmp-snippy"

  -- LSP
  use "ray-x/lsp_signature.nvim"
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      { 'williamboman/mason.nvim' }, -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' }, -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'hrsh7th/cmp-buffer' }, -- Optional
      { 'hrsh7th/cmp-path' }, -- Optional
      { 'saadparwaiz1/cmp_luasnip' }, -- Optional
      { 'hrsh7th/cmp-nvim-lua' }, -- Optional

      -- Snippets
      { 'L3MON4D3/LuaSnip' }, -- Required
      { 'rafamadriz/friendly-snippets' }, -- Optional
    }
  }

  -- Snippet
  use "SmiteshP/nvim-navic"
  use "b0o/SchemaStore.nvim" -- json
  use { "michaelb/sniprun", run = "bash ./install.sh" }

  use "RRethy/vim-illuminate"

  -- Java
  use "mfussenegger/nvim-jdtls"

  -- Fuzzy Finder/Telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-media-files.nvim"

  -- Treesitter
  use "nvim-treesitter/nvim-treesitter"
  use "nvim-treesitter/nvim-treesitter-context"
  use "p00f/nvim-ts-rainbow"
  use "nvim-treesitter/playground"
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

  -- Session
  use "rmagatti/auto-session"
  use "rmagatti/session-lens"

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

  -- Lualine
  -- use "nvim-lualine/lualine.nvim"
  use "christianchiarulli/lualine.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
