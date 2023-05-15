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
  profile = {
    enable = true,
    threshold = 1, -- the amount in ms that a plugins load tiem must be over for it to be included in the profile
  }
}

local function get_setup(name)
  return string.format('require("user/%s")', name)
end

-- Install your plugins here

return packer.startup(function(use)
  -- Plugin Mangager
  use "wbthomason/packer.nvim" -- Have packer manage itself- My plugins here

  -- Lua Development
  -- use {"nvim-lua/plenary.nvim", pattern={"lua"}} -- Useful lua functions used ny lots of plugins

  use { "windwp/nvim-autopairs", config = get_setup "autopairs" }
  use {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  }

  -- Icon
  use { "kyazdani42/nvim-web-devicons", config = get_setup("nvim-webdev-icons") }

  -- File Manager
  use {
    "kyazdani42/nvim-tree.lua",
    cmd = {"NvimTreeToggle", "NvimTreeOpen"},
    config = get_setup "nvim-tree",
  }

  -- Tabline
  use { "akinsho/bufferline.nvim", config = get_setup "bufferline" }
  use { "fgheng/winbar.nvim", config = get_setup "winbar", require = "SmiteshP/nvim-navic" }
  use {
      "SmiteshP/nvim-navic",
      requires = "neovim/nvim-lspconfig",
      config = get_setup("navic")
  }

  -- Golang
  use {
    "ray-x/go.nvim",
    pattern = "go",
    requires = { "ray-x/guihua.lua" },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = function()
      vim.cmd [[silent! GoGet]]
      vim.cmd [[ silent! require("go.install").update_all_sync()]]
    end,
  }

  --time start
  use "dstein64/vim-startuptime"

  -- Indent
  use { "lukas-reineke/indent-blankline.nvim", config = get_setup "indentline" }

  -- Keybinds
  use { "folke/which-key.nvim", config = get_setup "whichkey" }
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {}
    end,
  }

  -- Colorschemes
  use { "folke/tokyonight.nvim", config = get_setup "tokyonight" }

  -- Color detect
  use {"nvim-colortils/colortils.nvim", pattern="css, scs, stylus"}

  -- LSP
  use {
    "neovim/nvim-lspconfig",
    requires = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "jose-elias-alvarez/null-ls.nvim",
      "ray-x/lsp_signature.nvim",
    },
    config = get_setup "lsp",
  }

  -- Completion
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-nvim-lua" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-emoji" },
      { "hrsh7th/cmp-cmdline" },
      { "tzachar/cmp-tabnine", run = "./install.sh", config = get_setup "tabnine" },
    },
    config = get_setup "cmp",
  }
  --[[ use {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "VimEnter",
    requires = {"zbirenbaum/copilot-cmp"},
    config = function()
      require "user.copilot"
    end,
  } ]]

  -- Snippet
  use {
    "L3MON4D3/LuaSnip",
    run = "make install_jsregexp",
    requires = { "rafamadriz/friendly-snippets" },
  }

  -- Java
  use {"mfussenegger/nvim-jdtls", pattern={"java"}}

  -- Fuzzy Finder/Telescope
  use { "nvim-telescope/telescope.nvim", requires = "ThePrimeagen/harpoon", config = get_setup "telescope" }

  use {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup {}
    end,
  }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    requires = {
      "nvim-treesitter/nvim-treesitter-context",
      "RRethy/nvim-treesitter-textsubjects",
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = get_setup "treesitter",
  }
  use {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  }

  -- Surrond
  use { "kylechui/nvim-surround", config = get_setup "surround" }

  -- DAP
  use {
    "mfussenegger/nvim-dap",
    requires = {
      { "theHamsta/nvim-dap-virtual-text" },
      { "rcarriga/nvim-dap-ui" },
      { "ravenxrz/DAPInstall.nvim" },
      {
        "leoluz/nvim-dap-go",
        ft = "go",
        depedencies = "mfussenegger/nvim-dap",
        config = function(_, opts)
          require("dap-go").setup(opts)
        end,
      },
    },
    config = get_setup "dap",
  }

  -- View
  use {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
    pattern = "mkd",
  }

  -- git
  use {
    "lewis6991/gitsigns.nvim",
    config = get_setup "gitsigns",
  }
  use "kdheepak/lazygit.nvim"

  -- Utility
  use { "rcarriga/nvim-notify", config = get_setup "notify" }
  use { "stevearc/dressing.nvim", config = get_setup "dressing" }
  use "moll/vim-bbye"
  use "andymass/vim-matchup"
  use { "b0o/SchemaStore.nvim", pattern = { "json, xml, yaml" } }
  use { "RRethy/vim-illuminate", config = get_setup "illuminate" }
  use { "lvimuser/lsp-inlayhints.nvim", pattern = { "ts" } }
  -- use "https://git.sr.ht/~whynothugo/lsp_lines.nvim" -- virtual text

  -- twig
  use {"othree/html5.vim", ft="twig, html"}
  use {"lumiliet/vim-twig", ft="twig"}

  -- symfony
  use {"qbbr/vim-symfony", ft="php"}

  -- syntaxt highlighting
  -- use "sheerun/vim-polyglot"

  -- terminal
  -- use "akinsho/toggleterm.nvim"

  -- Lualine
  -- use "nvim-lualine/lualine.nvim"
  use { "christianchiarulli/lualine.nvim", config = get_setup "lualine" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
