local options = {
  backup = false, -- creates a backup file
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  cmdheight = 1, -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 1, -- so that `` is visible in markdown files
  -- colorcolumn = "80",
  colorcolumn = "120",
  fileencoding = "utf-8", -- the encoding written to a file
  hlsearch = true, -- highlight all matches on previous search pattern
  ignorecase = false, -- ignore case in search patterns
  mouse = "", -- allow the mouse to be used in neovim
  pumheight = 10, -- pop up menu height
  showmode = false, -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2, -- always show tabs
  smartcase = true, -- smart case
  smartindent = true, -- make indenting smarter again
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  swapfile = false, -- creates a swapfile
  termguicolors = true, -- set term gui colors (most terminals support this)
  timeoutlen = 300, -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true, -- enable persistent undo
  updatetime = 300, -- faster completion (4000ms default)
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true, -- convert tabs to spaces
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  tabstop = 2, -- insert 2 spaces for a tab
  cursorline = true, -- highlight the current line
  number = true, -- set numbered lines
  laststatus = 3,
  showcmd = false,
  ruler = false,
  textwidth = 500,
  relativenumber = true, -- set relative numbered lines
  numberwidth = 4, -- set number column width to 2 {default 4}
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  wrap = false, -- display lines as one long line
  scrolloff = 8, -- is one of my fav
  sidescrolloff = 8,
  guifont = "Hack Mono Font:h18:w45:b", -- the font used in graphical neovim applications
  autoindent = true,
  breakindent = true,
  backspace = "start,eol,indent", -- allow backspacing over everything in insert mode
  smarttab = true, -- insert indents automatically
  splitkeep = "screen", -- keep cursor in others screen or following screen focused
  spelllang = "en_us",
  spell = false,
}

for key, value in pairs(options) do
  vim.opt[key] = value
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
vim.opt.fillchars.eob = " "

vim.opt.shortmess:append "c"

vim.filetype.add {
  extension = {
    conf = "dosini",
  },
}

vim.o.background = "dark" -- or "light" for light mode

vim.loader.enable() -- start fast as possible
vim.g.transparent_background = true        -- transparent background(Default: false)
vim.g.italic_comments = true               -- italic comments(Default: true)
vim.g.italic_keywords = true               -- italic keywords(Default: true)
vim.g.italic_functions = true              -- italic functions(Default: false)
vim.g.italic_variables = true              -- italic variables(Default: false)

vim.lsp.set_log_level("debug")
