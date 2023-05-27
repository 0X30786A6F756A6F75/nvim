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
  profile = {
    enable = true,
    threshold = 1, -- the amount in ms that a plugins load tiem must be over for it to be included in the profile
  },
}

local function get_setup(name)
  return string.format('require("user/%s")', name)
end

-- Install your plugins here

return packer.startup(function(use)
  -- Plugin Mangager
  use "wbthomason/packer.nvim" -- Have packer manage itself- My plugins here

  -- Lua Development
  use { "nvim-lua/plenary.nvim" } -- Useful lua functions used ny lots of plugins

  use {
    "windwp/nvim-autopairs",
    event = "VimEnter",
    config = get_setup "autopairs",
  }
  use {
    "numToStr/Comment.nvim",
    config = get_setup "comment",
  }

  -- Icon
  use { "kyazdani42/nvim-web-devicons", config = get_setup "nvim-webdev-icons" }

  -- File Manager
  use {
    "kyazdani42/nvim-tree.lua",
    config = get_setup "nvim-tree",
  }

  -- Tabline
  use { "akinsho/bufferline.nvim", config = get_setup "bufferline" }
  -- use { "fgheng/winbar.nvim", config = get_setup "winbar" }
  use {
    "utilyre/barbecue.nvim",
    tag = "*",
    requires = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    after = "nvim-web-devicons", -- keep this if you're using NvChad
    config = get_setup "barbecue",
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
  --[[ use {
    "folke/todo-comments.nvim",
    cmd = "TodoLocList",
    config = get_setup "todo",
  } ]]

  -- Colorschemes
  use { "folke/tokyonight.nvim" }
  -- use {'ray-x/starry.nvim'}

  -- Color detect
  -- use { "nvim-colortils/colortils.nvim", pattern = "css, scs, stylus" }

  -- LSP
  use {
    "neovim/nvim-lspconfig",
    config = get_setup "lsp",
  }

  use "williamboman/mason-lspconfig.nvim"
  use "jose-elias-alvarez/null-ls.nvim"
  use "ray-x/lsp_signature.nvim"
  use "williamboman/mason.nvim"

  -- Completion
  use { "hrsh7th/nvim-cmp", config = get_setup "cmp"}
  use "hrsh7th/cmp-buffer"
  use { "hrsh7th/cmp-path" }
  use { "hrsh7th/cmp-nvim-lua" }
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "saadparwaiz1/cmp_luasnip" }
  use { "hrsh7th/cmp-emoji" }
  use { "hrsh7th/cmp-cmdline" }

  use {
    "tzachar/cmp-tabnine",
    run = "./install.sh",
    event = "VimEnter",
    config = get_setup "tabnine",
  }

  use {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "VimEnter",
    requires = { "zbirenbaum/copilot-cmp" },
    config = get_setup "copilot",
  }

  -- Snippet
  use {
    "L3MON4D3/LuaSnip",
    run = "make install_jsregexp",
    requires = { "rafamadriz/friendly-snippets" },
  }

  -- Java
  use {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
  }

  -- Fuzzy Finder/Telescope
  use {
    "nvim-telescope/telescope.nvim",
    requires = "ThePrimeagen/harpoon",
    config = get_setup "telescope",
  }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    "JoosepAlviste/nvim-ts-context-commentstring",
    "nvim-treesitter/nvim-treesitter-context",
    "nvim-treesitter/nvim-treesitter-textobjects",
    config = get_setup "treesitter",
    run =  'TSUpdate',
  }
  use {
    "windwp/nvim-ts-autotag",
    event = "VimEnter",
  }

  -- Surrond
  use { "kylechui/nvim-surround", config = get_setup "surround" }

  -- DAP
  use {
    "mfussenegger/nvim-dap",
    requires = {
      -- { "theHamsta/nvim-dap-virtual-text" },
      -- { "rcarriga/nvim-dap-ui" },
      -- { "ravenxrz/DAPInstall.nvim" },
      {
        "leoluz/nvim-dap-go",
        ft = "go",
        config = function(_, opts)
          require("dap-go").setup(opts)
        end,
      },
    },
    config = get_setup "dap",
  }

  -- View
  --[[ use {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
    cmd = "MarkdownPreview",
  } ]]
  use {"ellisonleao/glow.nvim", config = function() require("glow").setup() end}

  -- git
  use {
    "lewis6991/gitsigns.nvim",
    cmd = "Gitsigns",
    config = get_setup "gitsigns",
  }
  -- use {"kdheepRangerak/lazygit.nvim", cmd="LazyGit"}

  -- Utility
  use { "rcarriga/nvim-notify", config = get_setup "notify" }
  use { "stevearc/dressing.nvim", config = get_setup "dressing" }
  use "moll/vim-bbye"
  use "andymass/vim-matchup"
  use { "b0o/SchemaStore.nvim" }
  use { "RRethy/vim-illuminate", config = get_setup "illuminate" }
  use "lewis6991/impatient.nvim"

  -- twig
  use { "othree/html5.vim", ft = "twig, html" }
  use { "lumiliet/vim-twig", ft = "twig" }

  -- symfony
  use { "qbbr/vim-symfony", ft = "php" }

  -- syntaxt highlighting
  use "sheerun/vim-polyglot"

  -- Terminal
  use { "akinsho/toggleterm.nvim", config = get_setup "toggleterm" }

  -- Lualine
  -- use "nvim-lualine/lualine.nvim"
  use { "christianchiarulli/lualine.nvim", config = get_setup "lualine" }

  -- Replace
  use { "nvim-pack/nvim-spectre", config = get_setup "spectre", cmd = "Spectre" }

  -- Motion
  use { "phaazon/hop.nvim", config = get_setup "hop"}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
